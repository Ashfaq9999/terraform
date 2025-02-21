provider "aws" {
    region = "ap-south-1"
  
}


module "ec2" {
    source = "./modules/ec2"
    ami = "ami-0ddfba243cbee3768"
    type = "t2.micro"
  
}

module "s3" {
    source = "./modules/s3"
  
}
module "rds" {
  source = "./modules/rds"
}