terraform  {
    required_version = "~> 1.21" ## terraform version
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "> 3.23" ## aws provider version
        }
    }

## statefile management using S3 bucket
backend "s3"
{
    bucket = "sample-bucket"
    key = "sample/terraform.tfstate"
    region = "ap-southeast-1"
    encyrpt = "true"
    dynamodb_table = "infra-lock"
}
}

