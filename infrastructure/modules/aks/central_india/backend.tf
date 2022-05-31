provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
  }
  backend "azurerm" {
    resource_group_name      =  "rgrp-dci1-tw-tfstate-001"
    storage_account_name     =  "saccdci1twtfstate001"
    container_name           =  "tfstate-tw-mediawiki"
    key                      =  "mediawiki-ci1-non-prod-infra.tf.state"
  }
  required_version = ">= 0.14"
}