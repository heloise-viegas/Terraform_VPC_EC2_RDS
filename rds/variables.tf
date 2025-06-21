variable "vpc_id" {
  description = "The ID of the VPC where the resources will be created"
  type        = string  
  
  
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs where the RDS instance will be launched"
  type        = list(string)
}
variable "ec2_sg_id" {
  description = "The ID of the security group for EC2 instances"
  type        = string
  
}