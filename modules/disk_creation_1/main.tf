resource "google_compute_disk" "testdisk" {
  for_each     = var.server_size
      name  = "${each.key}-${var.disk_number}"
      size  = var.server_size[each.key]
      type  = var.disk_type
      zone  = var.disk_zone[each.key]
    labels = {
      tier = var.disk_tier[each.key]
    }
    physical_block_size_bytes = 4096
}
resource "google_compute_attached_disk" "attachdisk" {
  for_each      = var.server_size
    disk     =  google_compute_disk.testdisk[each.key].self_link
    device_name = "${each.key}-${var.disk_number}"
    instance = each.key
    zone = var.disk_zone[each.key]
}