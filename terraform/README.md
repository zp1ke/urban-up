# Terraform project

## Config

Create file `terraform.tfvars`:
```conf
aws = {
  access_key = "my-access-key"
  secret_key = "my-secret-key"
  region     = "us-east-2"
}

s3 = {
  key    = "my-s3/terraform.tfstate"
  bucket = "my-bucket"
}

dynamodb = {
  table          = "tfstate-lock-key"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
}

proxmox = {
  url       = "https://my-proxmox-endpoint/"
  api_token = "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"
}
```
