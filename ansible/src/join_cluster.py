#!/bin/env python3

import os
import json
import socket

# pega o token
stream = os.popen("kubeadm -o json token list") 
output = stream.read()

# pega a chave
stream2 = os.popen("openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'")
khash = stream2.read().strip()

# pega o endereco da interface eth0
stream3 = os.popen("ip -json addr show eth0")
output3 = stream3.read()

data = json.loads(output)
token = data['token']

data2 = json.loads(output3)  # le a saida do comando ip addr
ip_addr = data2[0]['addr_info'][0]['local'] 

join = f"sudo kubeadm join {ip_addr}:6443 --token {token} --discovery-token-ca-cert-hash sha256:{khash}"

with open('/home/ubuntu/join_cluster.sh', 'w') as f:
    f.write(join)