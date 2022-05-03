.PHONY: init
init: ## Executa o terraform e inicia o download de todos os plugins e inicializa o backend
	@cd terraform && terraform init -backend-config=backend.tfvars -lock=false

.PHONY: install
install: ## Executa o terraform e inicia o download de todos os plugins
	@cd terraform && terraform init -upgrade=true 

.PHONY: plan
plan: dry-run
.PHONY: dry-run
dry-run: ## Executa o terraform e aplica as alterações
	@cd terraform && terraform plan -lock=false

.PHONY: run
apply: run
.PHONY: apply
run: ## Executa o terraform e aplica as alterações
	@cd terraform && terraform apply -auto-approve -lock=false

.PHONY: fmt
fmt: ## Formata arquivos de código.
	@cd terraform ; \
		terraform fmt


.PHONY: show
show: ## Executa o terraform e mostra as alterações
	@cd terraform && terraform show

.PHONY: destroy
destroy: ## Executa o terraform e destroi as instâncias
	@cd terraform && terraform destroy 

.PHONY: join-workers
join-workers: ## Executa o ansible e adiciona os workers ao cluster
	@cd ansible && ansible-playbook -i inventory playbook.yml

.PHONY: ssh-keygen
ssh-keygen: ## Gera uma chave ssh
	@ssh-keygen -t rsa -b 4096 -f keys/devops-kubernets-key -N ""

.PHONY: help

help: ## This help.
	 ## Se utilizar backend s3 requer inicializar com o parametro init-backend
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help