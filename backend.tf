terraform {
  # This is commented out by default as you need to create these resources first
  # Uncomment and update with your own values once you have created the S3 bucket and DynamoDB table
  /*
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "ecs-infrastructure/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
  */
}

# For initial setup, you can use the local backend
# After creating the S3 bucket and DynamoDB table, switch to the S3 backend above