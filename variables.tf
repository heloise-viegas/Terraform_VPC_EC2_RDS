variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string

}

variable "subnet_names" {
  description = "Map of subnet names to CIDR blocks"
  type        = map(string)
}

variable "availability_zone" {
  description = "Map of subnet names to availability zones"
  type        = map(string)
}

variable "igw_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name tag for the NAT Gateway"
  type        = string
}

# variable "private_subnet_ids" {
#   description = "List of private subnet IDs where the RDS instance will be launched"
#   type        = list(string)
#   default = [aws_subnet.example["private-1a"].id]
  
# }