variable "profile" {
  default = "terraform"
  type    = string
}

variable "client_name" {
  description = "The name of the client"
  type        = string
  default     = "cvortex"
}

variable "region" {
  default = "us-east-1"
}

variable "storage_type" {
  default     = "gp2"
  description = "Storage type"
}

variable "instance_count" {
  default = "2"
}

variable "aws_amis" {
  default = {
    "us-east-1" = "ami-04505e74c0741db8d"
  }
}

variable "instance_type" {
  type    = list(string)
  default = ["t2.medium", "t2.micro"]
}

variable "bucket" {
  type    = string
  default = "cvortex"
}

variable "dynamodb_table" {
  type    = string
  default = "cvortex-locks"
}

variable "key" {
  type    = string
  default = "terraform.tfstate"
}

variable "encrypt" {
  type    = bool
  default = true
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
  default     = "us-east-1a"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-0a7c2ae551540230c"
}


variable "subnet_id" {
  type        = string
  description = "Subnet ID"
  default     = "subnet-07873a7376c366460"
}