resource "aws_instance" "dev" {
  ami = "ami-0ddfba243cbee3768"
  instance_type = "t2.micro"
  key_name = "keypair"
  tags = {
    Name= "ec2"
  }
}

#this command is used for import the instance in terraform 
#{terraform import aws_instance.dev i-0505797eb99d00810}