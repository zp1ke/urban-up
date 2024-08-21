terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.62.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.1"
    }
  }

  backend "s3" {}
}

provider "proxmox" {
  endpoint = var.proxmox.url
  insecure = var.proxmox.insecure
  ssh {
    agent = true
  }
}

provider "aws" {
  access_key = var.aws.access_key
  secret_key = var.aws.secret_key
  region     = var.aws.region
}

resource "aws_dynamodb_table" "cluinfra-state-lock" {
  name           = var.dynamodb.table
  hash_key       = var.dynamodb.hash_key
  read_capacity  = var.dynamodb.read_capacity
  write_capacity = var.dynamodb.write_capacity

  attribute {
    name = var.dynamodb.hash_key
    type = "S"
  }
}
