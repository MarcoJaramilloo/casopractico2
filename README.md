# Caso Práctico 2 — DevOps & Cloud (UNIR)

## Requisitos
- Azure CLI >= 2.6x
- Terraform >= 1.9
- Ansible >= 2.12
- Podman
- kubectl
- Python 3 + pip

## Despliegue
```bash
export ARM_SUBSCRIPTION_ID="b287eb6f-d0cf-4303-9c9a-74ff25a10104"
terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve
ansible-playbook ansible/playbook_podman.yml
ansible-playbook ansible/playbook_k8s.yml
```

## Destruir
```bash
terraform -chdir=terraform destroy -auto-approve
```
