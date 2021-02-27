variable "csv_input_file_name" {}
# variable "subnetwork" {}
# variable "os_image" {}
# variable "machine_type_size" {
#     type = map
# default = {
#     small   = "n1-standard-1"
#     medium  = "n1-standard-1"
#     large   = "n1-standard-1"
#     }
#   }
# variable "instance_type_size" {
#     type = map
# default = {
#     hana   ="centos-7"
#     sql    ="windows-2016"
#     app    ="windows-2016"
#     }
#   }

variable "subnetwork" {
    type = map
default = {
    x1q_app   ="projects/slb-it-infrastructure-01/regions/europe-west1/subnetworks/subnet01-ite-sap-prd-infra-be2012"
    x1q_hana  ="projects/slb-it-infrastructure-01/regions/europe-west1/subnetworks/subnet01-ite-sap-prd-infra-be2012"
    x1q_sql   ="projects/slb-it-infrastructure-01/regions/europe-west1/subnetworks/subnet01-ite-sap-prd-infra-be2012"
    }
  }
  variable "secondary_ip" {
      type = list(string)
      default = []
  }
  variable "sole_tenant" {
      type = list(string)
      default = []
  }
  variable "os_image" {
      type = string
  }
  variable "sec_alias_ip" {}