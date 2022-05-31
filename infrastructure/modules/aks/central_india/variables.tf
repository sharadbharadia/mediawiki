variable "resource_group_name"{
    type    = string
    default = "rgrp-dci1-tw-aks001"
}

variable "resource_group_location"{
    type    = string
    default = "Central India"
}

variable "aks_cluster_name"{
    type    = string
    default = "aks-dci1-tw-001"
}

variable "aks_cluster_dns_prefix"{
    type    = string
    default = "k8s-dci1-tw-001"
}

locals {
    tags = {
        application = "mediawiki"
        environment = "non-prod"
        iac         = "terraform"
    }
}