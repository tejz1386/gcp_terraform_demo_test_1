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
  # subnetwork          = "${var.subnetwork}"
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