#store terraform state file in s3 bucket. Prevents loosing the terraform state file when cloud9 instance is lost
terraform {
  backend "s3" {
    bucket         = "004326122988-terraformstates" # sandbox (account) specific settings
    key            = "terraform-examples/pgadmin4/state" # put your desired name for the TF state here
    region         = "eu-central-1" # use Frankfort as region
    profile        = "004326122988_cetdemo_sandbox_caws_PowerUser"
    dynamodb_table = "vfde-004326122988-tf-locks" # sandbox (account) specific settings
  }
}
