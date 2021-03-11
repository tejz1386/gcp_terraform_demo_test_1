# module "app_vm_build_3_disks" {
#   source = "./modules/app_vm_build_3_disks"
#   csv_input_file_name = "./development/gcp_server_input_3_disks.csv"
#   subnetwork = "subnet-development"
# }
# module "app_vm_build_4_disks" {
#   source = "./modules/app_vm_build_4_disks"
#   csv_input_file_name = "./development/gcp_server_input_4_disks.csv"
#   subnetwork = "subnet-development"
# }
module "app_vm_build_test" {
  source = "./modules/app_vm_build_test"
  csv_input_storage_file_name = "./development/gcp_storage_app_details.csv"
  csv_input_file_name = "./development/gcp_server_app_details.csv"
  st_key = "os_type"
  st_values = [ "slb_windows" ]

  # subnetwork = "subnet-development"
}
module "hana_vm_build_test" {
  source = "./modules/hana_vm_build_test"
  csv_input_storage_file_name = "./development/gcp_storage_hana_details.csv"
  csv_input_file_name = "./development/gcp_server_hana_details.csv"
  # subnetwork = "subnet-development"
}
module "sql_vm_build_test" {
  source = "./modules/sql_vm_build_test"
  csv_input_storage_file_name = "./development/gcp_storage_sql_details.csv"
  csv_input_file_name = "./development/gcp_server_sql_details.csv"
  st_key = "os_type"
  st_values = [ "slb_windows" ]

  # subnetwork = "subnet-development"
}
module "additional_disk" {
  source = "./modules/additional_disk"
  csv_input_additional_storage_file_name = "./development/additional_disk_creation.csv"
  # add_disk_size = "../module.csv_output_3.server_add_disk_01"
}
