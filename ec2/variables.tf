variable "vpc_id" {
  description = "The ID of the VPC where the resources will be created"
  type        = string  
  
  
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the EC2 instance will be launched"
  type        = string
}