##### Terraform

- Infrastructure-as-code, IaC
- [Providers](https://registry.terraform.io/browse/providers)

- To pass variable file on cmd line - `terraform plan --var-file="dev.tfvars"`
- To override variable value over cmd line - `terraform plan -var="s3_bucket_name=new-bucket-name-1"`
- Interpolatation syntax