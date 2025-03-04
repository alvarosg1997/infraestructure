# Infrastructure Terraform Setup

Este repositorio contiene la infraestructura básica configurada con Terraform para gestionar servicios en AWS y Kubernetes. A continuación se describen los pasos para configurarlo y desplegarlo.

## Requisitos previos

- Tener instalado Terraform (versión 1.5.0 o posterior).
- Tener configurado AWS CLI con las credenciales correspondientes en tu máquina local.
- Tener Minikube configurado para utilizar Kubernetes localmente.
- Tener un archivo `~/.kube/config` para la configuración de Kubernetes.

## Estructura del Proyecto

El repositorio está organizado de la siguiente manera:

``` bash
├── README.md                 # Este archivo
├── backend.tf                # Configuración del backend de Terraform (S3 + DynamoDB)
├── main.tf                   # Archivo principal de Terraform
├── modules/                  # Módulos de Terraform para cada servicio
│   ├── dynamoDB              # Módulo para DynamoDB
│   ├── ec2                   # Módulo para EC2 con Docker
│   ├── iam                   # Módulo para IAM
│   └── minikube              # Módulo para Minikube y Kubernetes
├── provider.tf               # Proveedor AWS y Kubernetes
├── text.txt                  # Archivo de ejemplo
└── variables.tf              # Variables generales
```

## Inicialización

1. Clona el repositorio:

   ```bash
   git clone https://github.com/tuusuario/infrastructure-terraform.git
   cd infrastructure-terraform 
   ```
2. inicializa el repositorio

   ```bash
   terraform init
   ```
Esto configurará el backend y descargará los proveedores necesarios.

## Configuración

### Variables

Las variables de configuración se definen en `variables.tf`. Algunos de los valores por defecto son los siguientes:

- `environment`: El entorno de despliegue, por defecto es "dev".
- `namespace`: El namespace de Kubernetes para el despliegue de Minikube, por defecto es "minikube-test".
- `namespace_monitoring`: El namespace de Kubernetes para el monitoreo, por defecto es "observability".
- `kube-version`: La versión de Kubernetes para la instalación de Prometheus y Grafana, por defecto es "69.7.2".

### Configuración de AWS

Este proyecto usa AWS como proveedor. Asegúrate de tener las credenciales configuradas en AWS CLI y de usar el perfil `asanchez` o ajusta la configuración según tus necesidades.

### Proveedores

El proyecto utiliza los siguientes proveedores:

- **AWS**: Para gestionar recursos como DynamoDB, EC2, y IAM.
- **Kubernetes**: Para gestionar los recursos dentro de un clúster Minikube.
- **Helm**: Para gestionar aplicaciones en Kubernetes como Prometheus y Grafana.

### Backend de Terraform
El backend se configura para usar S3 para almacenar el estado de Terraform y DynamoDB para el bloqueo de estado. Asegúrate de tener acceso a estos recursos en tu cuenta de AWS.
   ```bash
   backend "s3" {
    bucket         = "terraform-state-asanchez"
    key            = "AWS/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    profile        = "asanchez"
    encrypt        = true
}
   ```
### Módulos
- **Módulo dynamodb:** Configura tablas de DynamoDB.
- **Módulo ec2-docker:** Crea una instancia EC2 con Docker y Docker Compose.
- **Módulo minikube:** Configura el clúster de Minikube y el despliegue de aplicaciones en Kubernetes.

### Kubernetes

El módulo minikube configura un clúster Minikube y despliega recursos como Nginx en el clúster de Kubernetes. Además, instala Prometheus y Grafana en el namespace de monitoreo utilizando Helm.

### Despliegue

## Para desplegar la infraestructura, ejecuta los siguientes comandos:
1. Planifica el despliegue:
   ```bash
   terraform plan
    ```
2.	Aplica el despliegue:
	```bash
    terraform apply
    ```
3.	Para destruir los recursos:
```bash
terraform destroy
   ```

## Salidas

Al finalizar la ejecución, Terraform generará las siguientes salidas:

- `dynamodb_table_name`: El nombre de la tabla DynamoDB.
- `instance_public_ip`: La IP pública de la instancia EC2.
- `instance_private_ip`: La IP privada de la instancia EC2.
- `instance_public_dns`: El DNS público de la instancia EC2.
- `iam_user_name`: El nombre del usuario IAM creado.
- `iam_policy_arn`: El ARN de la política IAM creada.

## Notas adicionales

- Este proyecto está diseñado para ser ejecutado en AWS, pero puedes modificar los proveedores y variables según tus necesidades.

