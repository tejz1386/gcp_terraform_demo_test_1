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
  st_key = var.st_key
  st_values = var.st_values
  sole_tenant = ["yes"]
  metadata = "yes"
#   secondary_ip = ["yes"]
  # subnetwork          = "${var.subnetwork}"
#   sec_alias_ip = module.csv_output.backup_ip
  # os_image = "projects/b95696467908/global/images/win2016-byol-slb-image-01062021-v6"
}
module "disk_creation_1" {
  source = "../disk_creation_1"
  server_size =  module.csv_output_2.server_disk1_consolidation
  disk_zone = module.csv_output_2.server_zone_consolidation
  disk_tier = module.csv_output_2.server_tier_consolidation
  disk_number = "datadisk-d"
  disk_type   = "pd-standard"
}
module "disk_creation_2" {
  source = "../disk_creation_1"
  server_size =  module.csv_output_2.server_disk2_consolidation
  disk_zone = module.csv_output_2.server_zone_consolidation
  disk_tier = module.csv_output_2.server_tier_consolidation
  disk_number = "datadisk-f"
  disk_type   = "pd-ssd"
}
module "disk_creation_3" {
  source = "../disk_creation_1"
  server_size =  module.csv_output_2.server_disk3_consolidation
  disk_zone = module.csv_output_2.server_zone_consolidation
  disk_tier = module.csv_output_2.server_tier_consolidation
  disk_number = "datadisk-l"
  disk_type   = "pd-standard"
}
module "disk_creation_4" {
  source = "../disk_creation_1"
  server_size =  module.csv_output_2.server_disk4_consolidation
  disk_zone = module.csv_output_2.server_zone_consolidation
  disk_tier = module.csv_output_2.server_tier_consolidation
  disk_number = "pagedisk-e"
  disk_type   = "pd-standard"
}