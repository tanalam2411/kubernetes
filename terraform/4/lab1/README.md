

```bash
[cloud_user@ip-10-0-1-72 ~]$ ls
resource_ids.txt
[cloud_user@ip-10-0-1-72 ~]$ mkdir terraform_code
[cloud_user@ip-10-0-1-72 ~]$ 
[cloud_user@ip-10-0-1-72 ~]$ cd terraform_code/
[cloud_user@ip-10-0-1-72 terraform_code]$ vi main.tf
[cloud_user@ip-10-0-1-72 terraform_code]$ cat ../resource_ids.txt 
ami: ami-087c17d1fe0178315
subnet_id: subnet-084f4aa42d8d63208
[cloud_user@ip-10-0-1-72 terraform_code]$ vi main.tf 
[cloud_user@ip-10-0-1-72 terraform_code]$ vi main.tf 
[cloud_user@ip-10-0-1-72 terraform_code]$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.61.0...
- Installed hashicorp/aws v3.61.0 (self-signed, key ID 34365D9472D7468F)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```bash
[cloud_user@ip-10-0-1-72 terraform_code]$ tree -a
.
|-- main.tf
|-- .terraform
|   `-- providers
|       `-- registry.terraform.io
|           `-- hashicorp
|               `-- aws
|                   `-- 3.61.0
|                       `-- linux_amd64
|                           `-- terraform-provider-aws_v3.61.0_x5
`-- .terraform.lock.hcl

```

```bash
[cloud_user@ip-10-0-1-160 terraform_code]$ terraform plan -out=plan.out

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.vm will be created
  + resource "aws_instance" "vm" {
      + ami                                  = "ami-087c17d1fe0178315"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = "subnet-0c1a84742ce464129"
      + tags                                 = {
          + "Name" = "my-first-tf-node"
        }
      + tags_all                             = {
          + "Name" = "my-first-tf-node"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: plan.out

To perform exactly these actions, run the following command to apply:
    terraform apply "plan.out"
```

```bash
[cloud_user@ip-10-0-1-160 terraform_code]$ terraform show plan.out

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.vm will be created
  + resource "aws_instance" "vm" {
      + ami                                  = "ami-087c17d1fe0178315"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = "subnet-0c1a84742ce464129"
      + tags                                 = {
          + "Name" = "my-first-tf-node"
        }
      + tags_all                             = {
          + "Name" = "my-first-tf-node"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

```bash
[cloud_user@ip-10-0-1-160 terraform_code]$ terraform show -json  plan.out
{"format_version":"0.1","terraform_version":"0.14.3","planned_values":{"root_module":{"resources":[{"address":"aws_instance.vm","mode":"managed","type":"aws_instance","name":"vm","provider_name":"registry.terraform.io/hashicorp/aws","schema_version":1,"values":{"ami":"ami-087c17d1fe0178315","credit_specification":[],"get_password_data":false,"hibernation":null,"iam_instance_profile":null,"instance_type":"t3.micro","launch_template":[],"source_dest_check":true,"subnet_id":"subnet-0c1a84742ce464129","tags":{"Name":"my-first-tf-node"},"tags_all":{"Name":"my-first-tf-node"},"timeouts":null,"volume_tags":null}}]}},"resource_changes":[{"address":"aws_instance.vm","mode":"managed","type":"aws_instance","name":"vm","provider_name":"registry.terraform.io/hashicorp/aws","change":{"actions":["create"],"before":null,"after":{"ami":"ami-087c17d1fe0178315","credit_specification":[],"get_password_data":false,"hibernation":null,"iam_instance_profile":null,"instance_type":"t3.micro","launch_template":[],"source_dest_check":true,"subnet_id":"subnet-0c1a84742ce464129","tags":{"Name":"my-first-tf-node"},"tags_all":{"Name":"my-first-tf-node"},"timeouts":null,"volume_tags":null},"after_unknown":{"arn":true,"associate_public_ip_address":true,"availability_zone":true,"capacity_reservation_specification":true,"cpu_core_count":true,"cpu_threads_per_core":true,"credit_specification":[],"disable_api_termination":true,"ebs_block_device":true,"ebs_optimized":true,"enclave_options":true,"ephemeral_block_device":true,"host_id":true,"id":true,"instance_initiated_shutdown_behavior":true,"instance_state":true,"ipv6_address_count":true,"ipv6_addresses":true,"key_name":true,"launch_template":[],"metadata_options":true,"monitoring":true,"network_interface":true,"outpost_arn":true,"password_data":true,"placement_group":true,"primary_network_interface_id":true,"private_dns":true,"private_ip":true,"public_dns":true,"public_ip":true,"root_block_device":true,"secondary_private_ips":true,"security_groups":true,"tags":{},"tags_all":{},"tenancy":true,"user_data":true,"user_data_base64":true,"vpc_security_group_ids":true}}}],"configuration":{"provider_config":{"aws":{"name":"aws","expressions":{"region":{"constant_value":"us-east-1"}}}},"root_module":{"resources":[{"address":"aws_instance.vm","mode":"managed","type":"aws_instance","name":"vm","provider_config_key":"aws","expressions":{"ami":{"constant_value":"ami-087c17d1fe0178315"},"instance_type":{"constant_value":"t3.micro"},"subnet_id":{"constant_value":"subnet-0c1a84742ce464129"},"tags":{"constant_value":{"Name":"my-first-tf-node"}}},"schema_version":1}]}}}
```

```json
{
  "format_version": "0.1",
  "terraform_version": "0.14.3",
  "planned_values": {
    "root_module": {
      "resources": [
        {
          "address": "aws_instance.vm",
          "mode": "managed",
          "type": "aws_instance",
          "name": "vm",
          "provider_name": "registry.terraform.io/hashicorp/aws",
          "schema_version": 1,
          "values": {
            "ami": "ami-087c17d1fe0178315",
            "credit_specification": [],
            "get_password_data": false,
            "hibernation": null,
            "iam_instance_profile": null,
            "instance_type": "t3.micro",
            "launch_template": [],
            "source_dest_check": true,
            "subnet_id": "subnet-0c1a84742ce464129",
            "tags": {
              "Name": "my-first-tf-node"
            },
            "tags_all": {
              "Name": "my-first-tf-node"
            },
            "timeouts": null,
            "volume_tags": null
          }
        }
      ]
    }
  },
  "resource_changes": [
    {
      "address": "aws_instance.vm",
      "mode": "managed",
      "type": "aws_instance",
      "name": "vm",
      "provider_name": "registry.terraform.io/hashicorp/aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "ami": "ami-087c17d1fe0178315",
          "credit_specification": [],
          "get_password_data": false,
          "hibernation": null,
          "iam_instance_profile": null,
          "instance_type": "t3.micro",
          "launch_template": [],
          "source_dest_check": true,
          "subnet_id": "subnet-0c1a84742ce464129",
          "tags": {
            "Name": "my-first-tf-node"
          },
          "tags_all": {
            "Name": "my-first-tf-node"
          },
          "timeouts": null,
          "volume_tags": null
        },
        "after_unknown": {
          "arn": true,
          "associate_public_ip_address": true,
          "availability_zone": true,
          "capacity_reservation_specification": true,
          "cpu_core_count": true,
          "cpu_threads_per_core": true,
          "credit_specification": [],
          "disable_api_termination": true,
          "ebs_block_device": true,
          "ebs_optimized": true,
          "enclave_options": true,
          "ephemeral_block_device": true,
          "host_id": true,
          "id": true,
          "instance_initiated_shutdown_behavior": true,
          "instance_state": true,
          "ipv6_address_count": true,
          "ipv6_addresses": true,
          "key_name": true,
          "launch_template": [],
          "metadata_options": true,
          "monitoring": true,
          "network_interface": true,
          "outpost_arn": true,
          "password_data": true,
          "placement_group": true,
          "primary_network_interface_id": true,
          "private_dns": true,
          "private_ip": true,
          "public_dns": true,
          "public_ip": true,
          "root_block_device": true,
          "secondary_private_ips": true,
          "security_groups": true,
          "tags": {},
          "tags_all": {},
          "tenancy": true,
          "user_data": true,
          "user_data_base64": true,
          "vpc_security_group_ids": true
        }
      }
    }
  ],
  "configuration": {
    "provider_config": {
      "aws": {
        "name": "aws",
        "expressions": {
          "region": {
            "constant_value": "us-east-1"
          }
        }
      }
    },
    "root_module": {
      "resources": [
        {
          "address": "aws_instance.vm",
          "mode": "managed",
          "type": "aws_instance",
          "name": "vm",
          "provider_config_key": "aws",
          "expressions": {
            "ami": {
              "constant_value": "ami-087c17d1fe0178315"
            },
            "instance_type": {
              "constant_value": "t3.micro"
            },
            "subnet_id": {
              "constant_value": "subnet-0c1a84742ce464129"
            },
            "tags": {
              "constant_value": {
                "Name": "my-first-tf-node"
              }
            }
          },
          "schema_version": 1
        }
      ]
    }
  }
}
```

```bash
[cloud_user@ip-10-0-1-160 terraform_code]$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.vm will be created
  + resource "aws_instance" "vm" {
      + ami                                  = "ami-087c17d1fe0178315"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = "subnet-0c1a84742ce464129"
      + tags                                 = {
          + "Name" = "my-first-tf-node"
        }
      + tags_all                             = {
          + "Name" = "my-first-tf-node"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.vm: Creating...
aws_instance.vm: Still creating... [10s elapsed]
aws_instance.vm: Creation complete after 14s [id=i-0086f10cb1cd4ca88]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

```bash
[cloud_user@ip-10-0-1-160 terraform_code]$ ls -lrta
total 16
-rw-rw-r-- 1 cloud_user cloud_user  236 Oct  6 20:07 main.tf
drwxr-xr-x 3 cloud_user cloud_user   23 Oct  6 20:08 .terraform
-rwxrwxrwx 1 cloud_user cloud_user 1077 Oct  6 20:08 .terraform.lock.hcl
-rw-rw-r-- 1 cloud_user cloud_user 1646 Oct  6 20:08 plan.out
drwx------ 6 cloud_user cloud_user  189 Oct  6 20:08 ..
-rw-rw-r-- 1 cloud_user cloud_user 3745 Oct  6 20:16 terraform.tfstate
drwxrwxr-x 3 cloud_user cloud_user  107 Oct  6 20:16 .
```

```bash
[cloud_user@ip-10-0-1-160 terraform_code]$ terraform destroy

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_instance.vm will be destroyed
  - resource "aws_instance" "vm" {
      - ami                                  = "ami-087c17d1fe0178315" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:158609280676:instance/i-0086f10cb1cd4ca88" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 2 -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0086f10cb1cd4ca88" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t3.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - monitoring                           = false -> null
      - primary_network_interface_id         = "eni-069cb3dd08676ffcc" -> null
      - private_dns                          = "ip-10-0-1-61.ec2.internal" -> null
      - private_ip                           = "10.0.1.61" -> null
      - public_dns                           = "ec2-54-91-24-175.compute-1.amazonaws.com" -> null
      - public_ip                            = "54.91.24.175" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0c1a84742ce464129" -> null
      - tags                                 = {
          - "Name" = "my-first-tf-node"
        } -> null
      - tags_all                             = {
          - "Name" = "my-first-tf-node"
        } -> null
      - tenancy                              = "default" -> null
      - vpc_security_group_ids               = [
          - "sg-0bd4d2926e5861ac8",
        ] -> null

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - credit_specification {
          - cpu_credits = "unlimited" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-0630cfa5486538c1c" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.vm: Destroying... [id=i-0086f10cb1cd4ca88]
aws_instance.vm: Still destroying... [id=i-0086f10cb1cd4ca88, 10s elapsed]
aws_instance.vm: Still destroying... [id=i-0086f10cb1cd4ca88, 20s elapsed]
aws_instance.vm: Still destroying... [id=i-0086f10cb1cd4ca88, 30s elapsed]
aws_instance.vm: Still destroying... [id=i-0086f10cb1cd4ca88, 40s elapsed]
aws_instance.vm: Still destroying... [id=i-0086f10cb1cd4ca88, 50s elapsed]
aws_instance.vm: Still destroying... [id=i-0086f10cb1cd4ca88, 1m0s elapsed]
aws_instance.vm: Destruction complete after 1m0s

Destroy complete! Resources: 1 destroyed.
```
