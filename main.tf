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
  csv_input_storage_file_name = "./development/gcp_storage_input_test_disks.csv"
  csv_input_file_name = "./development/gcp_server_input_test_disks.csv"
  # subnetwork = "subnet-development"
}