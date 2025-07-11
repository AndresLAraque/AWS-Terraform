# EKS Terraform Project
Este proyecto despliega una arquitectura distribuida de AWS EKS (Elastic Kubernetes Service) usando Terraform.

![Deploy to EKS](https://github.com/AndresLAraque/AWS-Terraform/actions/workflows/deploy.yml/badge.svg)

Este repositorio despliega:
- Cluster EKS (infraestructura con Terraform)
- PostgreSQL con base de datos `prueba` y almacenamiento persistente
- pgAdmin conectado al clúster
- Grafana para monitoreo

## Estructura del proyecto
- `main.tf` — Define los módulos `VPC` y `EKS` con versiones específicas.
- `variables.tf` — Variables parametrizables para región, nombres, subredes, tipos de instancia, etc.
- `outputs.tf` — Outputs clave del cluster EKS (ID, Endpoint, Región).
- `terraform.tfvars` — Variables de configuración.

## Despliegue automático

Este proyecto usa **GitHub Actions** para desplegar en EKS. 
El pipeline se activa automáticamente en cada **push a `main`**. 

**Las claves AWS (`AWS_ACCESS_KEY_ID` y `AWS_SECRET_ACCESS_KEY`) se guardan como _Repository Secrets_ en GitHub.**  

## 🚀 Pasos para usar

Antes de empezar se debe clonar el repo:  
```bash
git clone https://github.com/AndresLAraque/AWS-Terraform.git

Ajustar la configuración de terraform.tfvars con valores correctos.

### 1. Inicializar Terraform
```bash
terraform init
```

### 2. Revisar el plan
```bash
terraform plan
```

Opcionalmente guarda el plan:
```bash
terraform plan -out=myplan.tfplan
```

### 3. Aplicar cambios

```bash
terraform apply
```

o usando el plan guardado:
```bash
terraform apply myplan.tfplan
```

### 4. Destruir recursos

Cuando termines, destruye todo para evitar costos:
```bash
terraform destroy -auto-approve
```

## ⚙️ Configuración de AWS CLI

Asegúrate de tener configuradas tus credenciales:
```bash
aws configure --profile enerbit
```

Y usa el mismo `profile` en `variables.tf` o `.tfvars`.

## ✅ Requisitos

- Terraform >= 1.3.0
- AWS CLI configurado
- Perfil IAM con permisos para crear EKS, VPC, IAM Roles

## 📌 Notas

- Los módulos usan versiones fijas (`eks` 20.0.0, `vpc` 5.1.0).
- El `inline_policy` genera un warning pero no bloquea.
- Revisa siempre `plan` antes de `apply`.

---

Desarrollado para prácticas y pruebas. **Recuerda destruir tu infraestructura cuando termines para evitar cargos innecesarios.**