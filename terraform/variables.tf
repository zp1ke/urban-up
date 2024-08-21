variable "aws" {
  description = "AWS config"
  type = object({
    access_key = string
    secret_key = string
    region     = string
  })
  sensitive = true

  validation {
    condition     = length(var.aws.access_key) > 4
    error_message = "Please provide a valid access_key for aws config."
  }

  validation {
    condition     = length(var.aws.secret_key) > 4
    error_message = "Please provide a valid secret_key for aws config."
  }

  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.aws.region))
    error_message = "Please provide a valid region for aws config."
  }
}

variable "s3" {
  description = "S3 config"
  type = object({
    key     = string
    bucket  = string
    encrypt = optional(bool, true)
  })
  sensitive = true

  validation {
    condition     = length(var.s3.key) > 4
    error_message = "Please provide a valid key for s3 config."
  }

  validation {
    condition     = length(var.s3.bucket) > 2
    error_message = "Please provide a valid bucket for s3 config."
  }
}

variable "dynamodb" {
  description = "DynamoDB config"
  type = object({
    table          = string
    hash_key       = string
    read_capacity  = optional(number, 20)
    write_capacity = optional(number, 20)
  })

  validation {
    condition     = length(var.dynamodb.table) > 4
    error_message = "Please provide a valid table for dynamodb config."
  }

  validation {
    condition     = length(var.dynamodb.hash_key) > 4
    error_message = "Please provide a valid hash_key for dynamodb config."
  }
}

variable "proxmox" {
  description = "Proxmox config"
  type = object({
    url       = string
    insecure  = optional(bool, true)
    api_token = string
  })
  sensitive = true

  validation {
    condition     = can(regex("http(s?)://.*", var.proxmox.url))
    error_message = "Please provide a valid url for proxmox config."
  }

  validation {
    condition     = length(var.proxmox.api_token) > 6
    error_message = "Please provide a valid token_id for proxmox config."
  }
}
