resource "aws_vpc" "custom-network" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "myvpc"
    }
    
  
}
resource "aws_subnet" "custom-network" {
    vpc_id =aws_vpc.custom-network.id
    cidr_block ="10.0.2.0/24"

    tags = {
      Name= "subnet1"
    }

  
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.custom-network.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subneto2p"
  }
}
# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "NATGateway"
  }
}

resource "aws_internet_gateway" "custom-network" {
    vpc_id = aws_vpc.custom-network.id
    tags = {
      Name="my-igw"
    }
  
}


resource "aws_route_table" "custom-network" {
    vpc_id = aws_vpc.custom-network.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.custom-network.id
        
    }  
    tags = {
      Name="publicrt"
    }
}
# Create a Route Table for the Private Subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom-network.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}


resource "aws_route_table_association" "custom-network" {
    subnet_id = aws_subnet.custom-network.id
    route_table_id = aws_route_table.custom-network.id
  
}
resource "aws_route_table_association" "dev" {
  subnet_id = aws_subnet.main.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_security_group" "dev" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.custom-network.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }
}



resource "aws_instance" "custom-network" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    #availability_zone = "ap-south-1a"
    key_name = "keypair"
    subnet_id = aws_subnet.custom-network.id
    vpc_security_group_ids = [aws_security_group.dev.id]
    tags = {
      Name= "terraform-instance"
    }

  
}