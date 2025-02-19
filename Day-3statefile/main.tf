resource "aws_instance" "name" {
    ami= "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "keypair"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "test"
    }
   
  
}

#in this block we will get to know about the importance of st.file
#Provides a history of changes that help in reverting to previous configurations if needed
#it gives the tracking history