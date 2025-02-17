terraform {
  backend "s3" {
    bucket = "statefile-backend"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    # dynamodb_table = "terraform-state-lock-dynamo" # DynamoDB table used for state locking, note: first run day-4-s3-dynamodb resource then day-4-state-remote-backend
    # encrypt= true  # Ensures the state is encrypted at rest in S3.

  }
}