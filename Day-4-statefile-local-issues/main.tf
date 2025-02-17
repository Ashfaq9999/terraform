resource "aws_instance" "name" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "keypair"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "test-instance"
    }
   
  
}


#note Developers Overwriting Each Other’s Work if separe state file for same project
#Merge Conflicts in terraform.tfstate
#If two developers run terraform apply at the same time, one may overwrite the other's changes, causing unexpected resource modifications.
#both developers working independetly not collabrative 
#solution: maintain common ststefile to overocme above issues 