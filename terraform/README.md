# terraform-EKS
architecture as code with terraform to AWS services 

```sh
terraform fmt

terraform login   # yes y meto la pass, para repositar en terraform registry

terraform init    # descarga todas las dependencias y modulos necesarios 

terraform validate

terraform plan

terraform apply -auto-approve

# Terraform Destroy
terraform apply -destroy -auto-approve
rm -rf .terraform*
rm -rf terraform.tfstate*

aws eks update-kubeconfig --region us-east-1 --name jgl-eks --alias jgl-eks --profile default
```

