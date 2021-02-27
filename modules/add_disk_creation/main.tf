locals {
  instances = "${csvdecode(file(var.csv_input_additional_storage_file_name))}"
  # temp = ["temp"]
}
resource "google_compute_disk" "testdisk" {
  for_each     = { for inst in local.instances : inst.add_gcp_vm_name => inst }
      name  = "${each.value.add_gcp_vm_name}-${each.value.gcp_vm_disk_desc}"
      size  = each.value.add_gcp_vm_disk 
      type  = "pd-standard"
      zone  = "europe-west1-d"
    labels = {
      environment = "development"
    }
    physical_block_size_bytes = 4096
}
resource "google_compute_attached_disk" "attachdisk" {
  for_each      = var.add_disk_size
    disk     =  google_compute_disk.testdisk[each.key].self_link
    instance =  each.key
    zone = "europe-west1-d"
}