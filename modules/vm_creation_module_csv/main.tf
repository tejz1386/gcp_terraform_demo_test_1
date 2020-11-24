locals {
  instances = "${csvdecode(file(var.csv_input_file_name))}"
}
resource "google_compute_address" "internal_with_subnet_and_address" {
  for_each      = { for inst in local.instances : inst.gcp_vm_name => inst }
    name         = "${each.value.gcp_vm_name}-ip01"
    # subnetwork   = var.subnetwork
      subnetwork   = lookup(var.subnetwork, each.value.gcp_tier_app)
    address_type = "INTERNAL"
    address      = each.value.gcp_vm_phy_ip
    region       = each.value.gcp_region
}

resource "google_compute_instance" "instancecreationcsv" {
  for_each      = { for inst in local.instances : inst.gcp_vm_name => inst }
  name          = each.value.gcp_vm_name
  # machine_type  = "${lookup(var.machine_type_size, each.value.machine_type)}"
  # machine_type  = each.value.gcp_vm_machine_type
  description = each.value.gcp_desc
  machine_type    = "n1-standard-1"
  zone          = each.value.gcp_zone
  tags = ["foo", "bar"]
  allow_stopping_for_update = false
  desired_status = each.value.gcp_vm_state
  deletion_protection = each.value.gcp_vm_protection
  boot_disk {
    initialize_params {
      image  = "windows-2016"
      # image = var.os_image
      # image = "${lookup(var.instance_type_size, each.value.instance_type)}"
    }
  }
  network_interface {
    # subnetwork = var.subnetwork
   subnetwork =  "${lookup(var.subnetwork, each.value.gcp_tier_app)}"
    network_ip = each.value.gcp_vm_phy_ip
    alias_ip_range {
      ip_cidr_range = each.value.gcp_vm_lgl_ip
      subnetwork_range_name = "secondary-range"
    }
  }
  lifecycle {
    ignore_changes = [attached_disk]
  }
  labels = {
    region      = each.value.gcp_region
    logicalname = each.value.gcp_vm_logical
    creator     = "terraform"
    os          = "windows2016"
    server_type = each.value.gcp_vm_type
    sid         = each.value.gcp_sid
    tier        = each.value.gcp_tier
  }
  metadata_startup_script = "echo hi > /test.txt"
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-rw"]
  }
}