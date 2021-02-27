resource "google_compute_disk" "testdisk" {
  for_each     = var.server_size
      name  = "${each.key}-${var.disk_number}"
      size  = var.server_size[each.key]
      type  = "pd-standard"
      zone  = "europe-west1-d"
    labels = {
      environment = "development"
    }
    physical_block_size_bytes = 4096
}
resource "google_compute_attached_disk" "attachdisk" {
  for_each      = var.server_size
    disk     =  google_compute_disk.testdisk[each.key].self_link
    instance = each.key
    zone = "europe-west1-d"
}