variable "num_of_buckets" {
  default = 1
}

resource "aws_s3_bucket" "bucket-1" {
  count = var.num_of_buckets != 0 ? var.num_of_buckets : 1
  bucket = "bucket-1"
}

variable "users" {
  default = ["batman", "superman", "ironman"]
}

resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name = each.value
}

variable "asg-tags" {
  type = map(string)
  default = {
    Name="ASG_EC2"
    Type="m4.large"
    Team="DEV"
  }
}

resource "aws_autoscaling_group" "asg" {
  max_size = 0
  min_size = 0

  dynamic "tag" {
    for_each = var.asg-tags
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true
    }
  }
}


output "uppercase_heroes" {
  // will return all heros of length less than 7 in upper case
  value = [for hero in var.users : upper(hero) if length(hero) < 7]
}

//output "s3_buc" {
//  value =
//}