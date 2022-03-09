provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

module "airflow" {
  source  = "idealo/mwaa/aws"
  version = ">=1.0.0"

  account_id           = "12345679"
  environment_name     = "MyEnvironment"
  internet_gateway_id  = "igw-0d91f3ea3f24c415e"
  region               = "us-west-2"
  private_subnet_cidrs = ["172.32.0.0/24","172.33.0.0/24"] # depending on your vpc ip range
  public_subnet_cidrs  = ["172.34.0.0/24","172.35.0.0/24"] # depending on your vpc ip range
  source_bucket_arn    = "arn:aws:s3:::foustmwaabucket"
  vpc_id               = "vpc-0ad04c53bba2df52c"
}
