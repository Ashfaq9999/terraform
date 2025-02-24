data "aws_subnet" "dev" {
    filter {
      name = "tag:Name"
      values = ["test"]
    }
  
}



resource "aws_instance" "dev" {
 ami= "ami=0ddfba243cbee3768"
 instance_type = "t2.micro"
  subnet_id = data.aws_subnet.dev.id
  
}