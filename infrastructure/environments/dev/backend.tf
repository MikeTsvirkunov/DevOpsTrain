terraform {
  backend "s3" {
    endpoint = "s3.twcstorage.ru"
    key = "devops/train/terraform.tfstate"
    region = "ru-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
    skip_region_validation = true
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true
    skip_s3_checksum = true
    # use_lockfile = true
  }
}

