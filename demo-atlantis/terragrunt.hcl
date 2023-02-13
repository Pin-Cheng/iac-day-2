/******************************
TERRAGRUNT CONFIGURATION
******************************/

# Configure the Terragrunt remote state to utilize a S3 bucket and state lock information in a DynamoDB table. 
# And encrypt the state data.
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "terraform-state20230204014116915100000001"
    key     = "atlantis/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    #    dynamodb_table = "terraform-lock-table"
  }
}