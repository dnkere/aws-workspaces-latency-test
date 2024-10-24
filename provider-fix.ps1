$ cat provider.tf
terraform {
  required_providers {
    hashicorp/instance  = {
      source = "hashicorp/aws"    
    }
  }
}