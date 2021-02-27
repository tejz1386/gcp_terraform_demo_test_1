module "csv_output_3" {
  source = "../csv_output_3"
  csv_input_additional_storage_file_name = "${var.csv_input_additional_storage_file_name}"
}

module "additional_disk" {
  source = "../add_disk_creation"
  csv_input_additional_storage_file_name = "${var.csv_input_additional_storage_file_name}"
  add_disk_size = module.csv_output_3.server_add_disk_01
}