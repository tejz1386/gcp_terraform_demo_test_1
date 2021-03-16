locals {
  virtualmachines = "${csvdecode(file(var.csv_input_file_name))}"
}
    data "null_data_source" "csv_file" {
      inputs = {
        file_data = "${chomp(file(var.csv_input_file_name))}"
               }
}

resource "null_resource" "csv_interpolation_method" {
  # locals {
  count = length(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))))

  triggers = {
    01 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 0)}"
    02 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 1)}"
    03 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 2)}"
    04 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 3)}"
    05 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 4)}"
    06 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 5)}"
    07 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 6)}"
    08 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 7)}"
    09 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 8)}"
    10 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 9)}"
    11 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 10)}"
    12 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 11)}"
    13 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 12)}"
    14 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 13)}"
    15 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 14)}"
    16 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 15)}" 
    17 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 16)}"
    18 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 17)}"
    # 19 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 18)}"
  }
  }
# }

locals {
  gcp_vm_name           = null_resource.csv_interpolation_method.*.triggers.01
  gcp_tier              = null_resource.csv_interpolation_method.*.triggers.02
  gcp_sid               = null_resource.csv_interpolation_method.*.triggers.03
  gcp_desc              = null_resource.csv_interpolation_method.*.triggers.04
  gcp_vm_type           = null_resource.csv_interpolation_method.*.triggers.05
  # gcp_vm_logical        = null_resource.csv_interpolation_method.*.triggers.06
  # gcp_ilb_frontend      = null_resource.csv_interpolation_method.*.triggers.07
  # gcp_instance_grp      = null_resource.csv_interpolation_method.*.triggers.08
  gcp_vm_phy_ip         = null_resource.csv_interpolation_method.*.triggers.06
  gcp_vm_lgl_ip         = null_resource.csv_interpolation_method.*.triggers.07
  # gcp_ilb_ip            = null_resource.csv_interpolation_method.*.triggers.11
  gcp_vm_machine_type   = null_resource.csv_interpolation_method.*.triggers.08
  gcp_region            = null_resource.csv_interpolation_method.*.triggers.09
  gcp_zone              = null_resource.csv_interpolation_method.*.triggers.10
  gcp_os_image          = null_resource.csv_interpolation_method.*.triggers.11
  gcp_vm_state          = null_resource.csv_interpolation_method.*.triggers.12
  gcp_vm_protection          = null_resource.csv_interpolation_method.*.triggers.13
  # gcp_vm_disk1          = null_resource.csv_interpolation_method.*.triggers.16
  # gcp_vm_disk2          = null_resource.csv_interpolation_method.*.triggers.17
  # gcp_vm_disk3          = null_resource.csv_interpolation_method.*.triggers.18
  gcp_tier_app          = null_resource.csv_interpolation_method.*.triggers.14
  servercount           = length(local.virtualmachines) 
  # disk_list             = tolist(["${local.gcp_vm_disk1}", "${local.gcp_vm_disk2}", "${local.gcp_vm_disk3}"])
  # server_disk_01        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk1}")
  # server_disk_02        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk2}")
  # server_disk_03        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk3}")
  
}
# output "server_disk1_consolidation" {
#   value = "${local.server_disk_01}"
# }
# output "server_disk2_consolidation" {
#   value = "${local.server_disk_02}"
# }
# output "server_disk3_consolidation" {
#   value = "${local.server_disk_03}"
#}
# output "server_disk4_consolidation" {
#   value = "${local.server_disk_04}"
# }
# output "server_index" {
#   value = "${local.server_index}"
# }
# output "server_disk_list" {
#   value = "${local.disk_list}"
# }
output "server_output" {
  value = "${local.gcp_vm_name}"
}
output "server_location" {
  value = "${local.gcp_region}"
}
output "server_ip" {
  value = "${local.gcp_vm_phy_ip}"
}
output "backup_ip" {
  value = "${local.gcp_vm_lgl_ip}"
}
output "server_zone" {
  value = "${local.gcp_zone}"
}
output "server_type" {
  value = "${local.gcp_vm_type}"
}
output "server_machine_type" {
  value = "${local.gcp_vm_machine_type}"
}
output "server_instance_type" {
  value = "${local.gcp_os_image}"
}
# output "server_os_disk" {
#   value = "${local.os_disk}"
# }
# output "server_disk_1" {
#   value = "${local.gcp_vm_disk1}"
# }
# output "server_disk_2" {
#   value = "${local.gcp_vm_disk1}"
# }
# output "server_disk_3" {
#   value = "${local.gcp_vm_disk1}"
# }
# output "server_disk_4" {
#   value = "${local.data_disk_04}"
# }
# output "server_disk_number" {
#   value = "${local.disk_number}"
# }
output "server_count" {
  value = "${local.servercount}"
}
output "gcp_tier_app" {
  value = "${local.gcp_tier_app}"
}

