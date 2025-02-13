resource "aws_instance" "name" {
    count = 1
    ami = var.ami_id
    instance_type = var.instace_type
    key_name = var.key
    
}