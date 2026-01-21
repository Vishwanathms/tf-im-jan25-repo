variable "region" {
  default = "ap-south-1"
}

variable "env" {}

variable "ami_id" {}
variable "num_of_vm" {
  type = number
  validation {
    condition     = var.num_of_vm >= 1 && var.num_of_vm <= 10
    error_message = "Instance count must be between 1 and 10."
  }

}

variable "instance_type" {
  type = string
  validation {
    condition     = contains(["t3.nano", "t3.micro"], var.instance_type)
    error_message = "Only t3.nano or t3.micro are allowed."
  }
}


variable "subnets" {
  type = list(any)

}

variable "region_ami_map" {
  type = map(string)
  default = {
    "ap-south-1" = "ami-0ced6a024bb18ff2e"
    "us-east-1"  = "ami-12345"
  }
}

# "ami-0ced6a024bb18ff2e"

# "t3.micro"

# terraform plan -var region="ap-south-1" -var ami_id="ami-0ced6a024bb18ff2e" -var instance_type="t3.micro" -var num_of_vm="2"
