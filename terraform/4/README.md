##### ACloud GURU - HashiCorp Certified Associate


- Providers: https://registry.terraform.io/browse/providers
- `export TF_LOG=TRACE` - to enable debug mode
- Docs - https://www.terraform.io/docs/language/index.html
- Variables:
  ```terraform
  variable "my-var" {
    description = "Test Variable"
    type = string
    default = "Hello"
  }
  ```
  OR
  ```terraform
  variable "my-var" {}
  ```
  - In this case you will to pass the value of variable either using OS Env variable or cmd line input or else you will get a run time error.
  - Referencing a variable: `var.my-var`
  - Best practise to pass value of variable using `terraform.tfvars`
  - [Diff between terraform.tfvars vs variables.tf](https://stackoverflow.com/questions/56086286/terraform-tfvars-vs-variables-tf-difference)
  - A `variables.tf` file is used to define the variables type and optionally set a default value. 
  - A `terraform.tfvars` file is used to set the actual values of the variables.
  - Variable validation:
    ```terraform
    variable "my-var" {
      description = "Test Variable"
      type        = string
      default     = "Hello"
      validation {
        condition = length(var.my-var) > 4
        error_message = "The string must be more than 4 characters"
      }
    }
    ```
  - `sensetive` config which, if set true then forces not to display value of the variable using terraform execution.(Default value is false)
  - Base Types: `string`, `number`, `bool`
  - Complex Types: `list`, `set`, `map`, `object`, `tuple`
  - Examples:
    - List Type:
      ```terraform
        variable "availability_zone_names" {
          type    = list(string)
          default = ["us-west-1a"]
      }
      ```
    - List of Objects:
      ```terraform
        variable "docker_ports" {
          type = list(object({
            internal = number
            external = number
            protocol = string
          }))
          default = [
              {
                internal = 8300
                external = 8300
                protocol = "tcp"
              }   
          ]
      }
      ```
  - Precedence of how variable is read at runtime, so the highest precedence is given to `OS Env vars` then `terraform.tfvars` file 
- Terraform Output - Output values
  ```terraform
    output "instance_ip" {
      description = "VM's Private IP"
      value       = aws_instance.my-vm.private_ip
    }
  ```
  - Output variable values are shown on the shell after running `terraform apply`.
  - Output values are like return values that you want to track after successful Terraform deployment.