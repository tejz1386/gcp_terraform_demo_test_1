module "csv_output_additional_storage" {
  source = "../csv_output_additional_storage"
  csv_input_additional_storage_file_name = "${var.csv_input_additional_storage_file_name}"
}

module "additional_disk" {
  source = "../add_disk_creation"
  csv_input_additional_storage_file_name = "${var.csv_input_additional_storage_file_name}"
  add_disk_size = module.csv_output_additional_storage.server_add_disk_01
  disk_zone = module.csv_output_additional_storage.server_gcp_vm_zone
}