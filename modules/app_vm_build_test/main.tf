module "csv_output" {
  source = "../csv_output"
  csv_input_file_name = "${var.csv_input_file_name}"
}
module "csv_output_2" {
  source = "../csv_output_2"
  csv_input_storage_file_name = "${var.csv_input_storage_file_name}"
}
module "vm_creation_module_csv" {
  source = "../vm_creation_module_csv"
  csv_input_file_name = "${var.csv_input_file_name}"
  secondary_ip = ["yes"]
  sole_tenant = ["yes"]
  # subnetwork          = "${var.subnetwork}"
  sec_alias_ip = module.csv_output.backup_ip
  os_image = "projects/b95696467908/global/images/win2016-byol-slb-image-01062021-v6"
}
module "disk_creation_1" {
  source = "../disk_creation_1"
  server_size =  module.csv_output_2.server_disk1_consolidation
  disk_number = "datadisk-d"
  # disk_type   = "pd-ssd"
}
module "disk_creation_2" {
  source = "../disk_creation_1"
  server_size =  module.csv_output_2.server_disk2_consolidation
  disk_number = "pagedisk-e"
  # disk_type   = "pd-ssd"
}
# module "network_creation" {
#   source = "../network_creation"
#   csv_input_file_name = "${var.csv_input_file_name}"
#   subnetwork = "${var.subnetwork}"
# }