# Desafio DevOps CVortex.

O processo de desenvolvimento da Infraestrutura é executado em 4 momentos.

1 - Cria-se a profile com a chave correta para o deploy na Infra da AWS, usando o cliente aws-cli.

2 - Ajusta o nome do profile a ser utilizado para conexão, neste exemplo deixei prefixado como [terraform]

3 - Executa-se os passos de deploy descritos abaixo.

  3.1 - Executa-se o comando **make keygen** para gerar a chave de acesso, inicialmente foi deixado fixado o nome, mas podemos facilmente fazer isso de forma mais dinâmica.
  
  3.2 - Executa-se o comando **make init** para inicializar o ambiente, o ambiente é inicializado usando-se o terraform, onde ira provisionar as 3 máquinas, sendo uma master e 2 workers, as máquinas são provisionadas utilizando o cloud-init.
  
  3.3 - Executa-se o comando **make plan** para gerar um plano de deploy, onde será gerado um arquivo de plano de deploy, que será utilizado para realizar o deploy.
  
  3.4 - Executa-se o comando **make apply** para realizar o deploy, onde será realizado o deploy do plano gerado anteriormente.
  
  3.5 - Após a inicialização do ambiente, teremos criado automatica o inventory para a execucão do ansible e conclusão do processo de deploy e inclusão ao cluster.
  
4 - Executa-se o ansible para ajustes do hostname das máquinas, copia-se um pequeno programa em python que gera sobe demanda um shell script com as informacões corretas para deploy dos workers.

  4.1 - O Ansible pode ser executado por meio do Makefile **make join-workers** ou acessando seu diretório ansible, e executando o comando **ansible-playbook -i inventory playbook.yml**.

Toda a parte da segurança dos servidores encontra-se no arquivo security.tf, foi feito de forma simples e objetivo para fácil entendimento e modificacão.

Não foi adicionado meu IP externo ao security.tf.
