# Caso Práctico 2 — DevOps & Cloud (UNIR)

Automatización de despliegues en Microsoft Azure usando Terraform y Ansible.

## Arquitectura

- **ACR**: Registro privado de imágenes de contenedor
- **VM Linux + Podman**: App web Nginx con HTTPS (x.509) y autenticación htpasswd
- **AKS**: Clúster Kubernetes gestionado con app contador persistente (PVC)

## Requisitos

- Azure CLI >= 2.6x
- Terraform >= 1.9
- Ansible >= 2.12 + colección containers.podman
- Podman (para construir imágenes)
- kubectl
- Python 3

## Pasos de despliegue

### 1. Login en Azure
```bash
az login --use-device-code
export ARM_SUBSCRIPTION_ID="<tu-subscription-id>"
```

### 2. Crear infraestructura con Terraform
```bash
terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve
```

### 3. Construir y subir imágenes al ACR
```bash
ACR=$(terraform -chdir=terraform output -raw acr_login_server)
ACR_USER=$(terraform -chdir=terraform output -raw acr_admin_username)
ACR_PASS=$(terraform -chdir=terraform output -raw acr_admin_password)

podman login $ACR --username $ACR_USER --password $ACR_PASS
podman build --platform linux/amd64 -t $ACR/app-web:casopractico2 app-web/
podman build --platform linux/amd64 -t $ACR/app-k8s:casopractico2 app-k8s/
podman push $ACR/app-web:casopractico2
podman push $ACR/app-k8s:casopractico2
```

### 4. Desplegar app web en VM con Ansible
```bash
ansible-playbook ansible/playbook_podman.yml
```

### 5. Desplegar app contador en AKS con Ansible
```bash
ansible-playbook ansible/playbook_k8s.yml
```

## Destruir infraestructura
```bash
terraform -chdir=terraform destroy -auto-approve
```

## Credenciales app web
- Usuario: `alumno`
- Contraseña: `unir2026`

## Licencia
MIT — ver fichero LICENSE
