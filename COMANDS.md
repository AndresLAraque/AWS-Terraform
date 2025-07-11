# Guía de Comandos EKS + Terraform + Kubernetes + Git

## Configuración AWS

```bash
aws configure
```
Configurar claves de acceso de tu cuenta AWS (Access Key ID, Secret Access Key, región por defecto, formato de salida).

```bash
aws sts get-caller-identity
```
Verificar la identidad actual configurada.

```bash
aws configure --profile enerbit
```
Crear o actualiza un perfil personalizado llamado `enerbit`.

---

## EKS - Conectar y gestionar clúster

```bash
aws eks update-kubeconfig --region us-east-1 --name demo-eks-cluster --profile enerbit
```
Agrega el clúster EKS a tu kubeconfig.

```bash
aws eks describe-cluster --region us-east-1 --name demo-eks-cluster --profile enerbit
```
Describe detalles técnicos del clúster.

```bash
kubectl config current-context
```
Confirma contexto activo.

```bash
kubectl config get-contexts
```
Lista contextos.

```bash
kubectl cluster-info
```
Muestra información del clúster.

```bash
kubectl get nodes -o wide
```
Verifica nodos.

---

## Terraform

```bash
terraform state list
```
Lista recursos gestionados.

```bash
Remove-Item -Force .terraform.lock.hcl
```
Elimina lockfile.

```bash
aws ec2 delete-vpc --vpc-id vpc-xxxxxxxx --region us-east-2 --profile enerbit
```
Elimina VPC.

---

## Git

```bash
git remote add origin https://github.com/AndresLAraque/AWS-Terraform.git
git add .
git commit -m "Comentario"
git push -u origin main
```

---

## Despliegue Kubernetes

```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc
kubectl get pvc
kubectl apply -f k8s/postgresql/postgres-deployment.yaml
```

---

## Interactuar con PostgreSQL

```bash
kubectl cp .\init.sql postgres-0:/init.sql
kubectl exec -it postgres-0 -- bash
psql -U postgres -d prueba -f /init.sql
psql -U postgres -d prueba
SELECT * FROM empleados;
```

---

## Validar despliegue y recursos

```bash
kubectl get pods
kubectl get svc
kubectl get pvc
```

---

## Notas finales

- Mantener `AWS_ACCESS_KEY_ID` y `AWS_SECRET_ACCESS_KEY` en GitHub Secrets.
- Nunca subir `terraform.tfstate` ni `.terraform`.

