locals {
  instances = "${csvdecode(file(var.csv_input_file_name))}"
}
# module "csv_output" {
#   source = "../csv_output"
#   csv_input_file_name = "${var.csv_input_file_name}"
# }
resource "google_compute_address" "internal_with_subnet_and_address" {
  for_each      = { for inst in local.instances : inst.gcp_vm_name => inst }
    name         = "${each.value.gcp_vm_name}-ip02"
    subnetwork   = var.subnetwork
    address_type = "INTERNAL"
    address      = each.value.gcp_vm_lgl_ip
    region       = each.value.gcp_region
}
