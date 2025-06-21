output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.example["public-1a"].id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.example["private-1a"].id,
    aws_subnet.example["private-1b"].id
  ]
}

output "vpc_name" {
  value = aws_vpc.main.tags["Name"]
  
}

# output "vpc_id" {
#   value = aws_vpc.main.id
  
# }
output "subnet_ids" {
  value = [for s in values(aws_subnet.example) : s.id]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.example.id
}