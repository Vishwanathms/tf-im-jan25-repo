
provider "aws" {
  #region = "ap-south-1"
  region = var.region
  default_tags {
    tags = {
      owner = "Viswa-01"
    }
  }
}

locals {
  tag_Name = "Viswa-01-${var.env}"
}

resource "aws_instance" "main" {
    #ami = var.ami_id
    ami = var.region_ami_map[var.region]
    instance_type = var.instance_type
    #subnet_id = "subnet-12345"
    #subnet_id = data.aws_subnet.subnet1.id
    subnet_id = var.subnets[count.index]
    count = var.num_of_vm

  tags = {
    "Name" = local.tag_Name
    "owner" = "Viswa-01-added"
  }
}
 
output "vm_pip" {
  value = aws_instance.main[0].public_ip
}

output "vm_pips" {
  value = [for vm in aws_instance.main : vm.public_ip ]
}