resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
    tags = {
    Name = var.vpc_name
  }
}


resource "aws_subnet" "example" {
    for_each = var.subnet_names
    vpc_id = aws_vpc.main.id
    cidr_block = each.value
    availability_zone = var.availability_zone[each.key]
    map_public_ip_on_launch = true
    tags = {
      Name= each.key
    }
  
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.example["public-1a"].id

  tags = {
    Name = var.nat_gateway_name
  }
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_eip" "example" {
  vpc = true
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block =  "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
}

resource "aws_route_table_association" "private" {
  for_each = {
   for k,v in var.subnet_names: k => v
   if k == "private-1a" || k == "private-1b"
    }
  subnet_id      = aws_subnet.example[each.key].id
  route_table_id = aws_route_table.private.id
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public" {
    for_each = {
      for k,v in var.subnet_names: k => v
        if k == "public-1a" || k == "public-1b"
    }
  subnet_id      = aws_subnet.example[each.key].id
  route_table_id = aws_route_table.public.id
}



