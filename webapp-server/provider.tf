
provider "aws" {
    region =  var.aws_region
    tags = {
        env_type = "dev"
        
    }
}
