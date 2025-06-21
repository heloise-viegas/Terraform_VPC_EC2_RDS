variable "subnet_names" {
    type = map(string)
    default = {
    "public-1a"  = "10.0.1.0/24"
    "public-1b"  = "10.0.2.0/24"
    "private-1a" = "10.0.3.0/24"
    "private-1b" = "10.0.4.0/24"
    }
  
}

variable "availability_zone" {
  description = "Map of subnet names to availability zones"
  type        = map(string)
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "vpc_name" {
    type = string
    default = "main-vpc"
  
}

variable "igw_name" {
    type = string
    default = "main-igw"
  
}
variable "nat_gateway_name" {
    type = string
    default = "main-nat-gateway"
  
}