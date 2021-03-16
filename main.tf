module "app_vm_build" {
  source = "./modules/app_vm_build"
  csv_input_storage_file_name = "./development/gcp_storage_app_details.csv"
  csv_input_file_name = "./development/gcp_server_app_details.csv"
  st_key = "os_type"
  st_values = [ "slb_windows" ]
}
module "hana_vm_build" {
  source = "./modules/hana_vm_build"
  csv_input_storage_file_name = "./development/gcp_storage_hana_details.csv"
  csv_input_file_name = "./development/gcp_server_hana_details.csv"
}
module "sql_vm_build" {
  source = "./modules/sql_vm_build"
  csv_input_storage_file_name = "./development/gcp_storage_sql_details.csv"
  csv_input_file_name = "./development/gcp_server_sql_details.csv"
  st_key = "os_type"
  st_values = [ "slb_windows" ]
}
module "additional_disk" {
  source = "./modules/additional_disk"
  csv_input_additional_storage_file_name = "./development/additional_disk_creation.csv"
}
