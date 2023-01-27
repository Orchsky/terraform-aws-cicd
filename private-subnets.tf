resource "aws_subnet" "private" {
    count = length(slice(local.az_names, 0, 2))
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = cidrsubnet(var.vpc_cidr,8, count.index + length(local.az_names))
    availability_zone = local.az_names[count.index] 

    tags = {
        Name = "PrivateSubnet-${count.index + 1}"
    }
}

resource "aws_instance" "nat" {
    ami = var.nat_amis
    instance_type = "t2.micro"
    subnet_id = local.pub_sub_ids[0]
    source_dest_check = false 
    vpc_security_group_ids = [aws_security_group.nat_sg.id]

    tags = {
        Name = "OrchskyNAT"
    }
}

resource "aws_security_group" "nat_sg" {
  name = "nat_sg"
  vpc_id = aws_vpc.my_vpc.id 

  egress {
    from_port = 0 
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nat_sg"
  }
}