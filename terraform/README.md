# Terraform project

## Config

Fill following files with your data.

File `backend.conf` for [s3 config](https://www.terraform.io/docs/language/settings/backends/s3.html):
```conf
bucket         = "my-bucket"
key            = "my-s3/terraform.tfstate"
region         = "us-east-2"
dynamodb_table = "tfstate-lock-key"
encrypt        = "true"
```

File `terraform.tfvars`:
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

Init terraform:
```shell
terraform init -backend-config=backend.conf
```
