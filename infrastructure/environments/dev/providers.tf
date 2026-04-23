terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.5.3"
  backend "s3" {
    endpoint = "https://s3.twcstorage.ru"
    key = "devops/train/terraform.tfstate"
    region = "ru-1"
    bucket="66ef2141-998128f1-c885-4840-8754-ed045ec10bb0"
    # dynamodb_table = "terraform-state-lock"
    encrypt = true
    use_lockfile = true
    skip_region_validation = true
    skip_credentials_validation = true
    # skip_metadata_api_check = true
    # skip_requesting_account_id = true
    # skip_s3_checksum = true
  }
}