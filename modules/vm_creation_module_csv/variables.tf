variable "csv_input_file_name" {}
variable "subnetwork" {
    type = map
default = {
    x1q_app   ="projects/slb-it-infrastructure-01/regions/europe-west1/subnetworks/subnet01-ite-sap-prd-infra-be2012"
    x2q_app   ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-qa-n-app-nl2018"
    x2q_hana  ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-qa-n-hana-db-nl2018"
    x2q_sql   ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-qa-n-sql-db-nl2018"
    x2d_app   ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-dev-sbx-n-app-nl2018"
    x2d_hana  ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-dev-sbx-n-hana-db-nl2018"
    x2d_sql   ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-dev-sbx-n-sql-db-nl2018"
    x2s_app   ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-dev-sbx-n-app-nl2018"
    x2s_hana  ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-dev-sbx-n-hana-db-nl2018"
    x2s_sql   ="projects/slb-it-infrastructure-01/regions/europe-west4/subnetworks/subnet01-ite-sap-dev-sbx-n-sql-db-nl2018"
    }
  }
variable "secondary_ip" {
    type = list(string)
    default = []
}
variable "alias_ip" {
   type = list(string)
      default = ["yes"]
   }
  variable "sole_tenant" {
    type = list(string)
    default = []
  }
variable "os_image" {
    type = map
    default = {
        windows2016 = "projects/b95696467908/global/images/family/slb-sap-windows2016-byol-app"
        windows2012 = "projects/b95696467908/global/images/family/slb-sap-windows2016-byol-app"
        sles12sp4   = "projects/b95696467908/global/images/sles12sp4-std-byol-slb-image-01202021-v6"
    }
  }
variable "os_tag" {
    type        = list(string)
    default = []
}
variable "metadata" {
    type =string
    default = ""
}
variable "st_key" {
    type = string
    default = ""
}
variable "st_values" {
    type = list(string)
    default = []
}
variable "scopes" {
    type = list(string)
    default = ["compute-ro", "storage-rw", "service-management", "monitoring-write", "logging-write", "service-control", "https://www.googleapis.com/auth/trace.append" ]
}