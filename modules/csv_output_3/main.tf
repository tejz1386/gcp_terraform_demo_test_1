locals {
  add_storage_data = "${csvdecode(file(var.csv_input_additional_storage_file_name))}"
}
    data "null_data_source" "csv_file" {
      inputs = {
        file_data = "${chomp(file(var.csv_input_additional_storage_file_name))}"
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
  }
# }
}

locals {
  add_gcp_vm_name          = null_resource.csv_interpolation_method.*.triggers.01
  add_gcp_vm_disk          = null_resource.csv_interpolation_method.*.triggers.02
  gcp_vm_disk_desc         = null_resource.csv_interpolation_method.*.triggers.03
  gcp_vm_disk_disktype     = null_resource.csv_interpolation_method.*.triggers.04
  gcp_vm_zone              = null_resource.csv_interpolation_method.*.triggers.05
  gcp_tier                 = null_resource.csv_interpolation_method.*.triggers.06
  server_add_disk_01       = zipmap("${local.add_gcp_vm_name}","${local.add_gcp_vm_disk}")

  # add_gcp_vm_name           = locals.triggers.01
  # add_gcp_vm_disk          = locals.triggers.02
  # gcp_vm_disk_desc          = locals.triggers.03
  # gcp_vm_disk_label01          = locals.triggers.04
  # gcp_vm_disk_label02          = locals.triggers.05
  # gcp_vm_disk_label03          = locals.triggers.06
  # server_add_disk_01        = zipmap("${local.add_gcp_vm_name}","${local.add_gcp_vm_disk}")

#   server_disk_02        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk2}")
#   server_disk_03        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk3}")
#   server_disk_04        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk4}")
#   server_disk_05        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk5}")

}

output "server_disk1_consolidation" {
  value = "${local.add_gcp_vm_name}"
}
output "server_disk2_consolidation" {
  value = "${local.add_gcp_vm_disk}"
}
output "server_disk3_consolidation" {
  value = "${local.gcp_vm_disk_desc}"
}
output "server_disk4_consolidation" {
  value = "${local.gcp_vm_disk_disktype}"
}
output "server_disk5_consolidation" {
  value = "${local.gcp_vm_zone}"
}
output "server_disk6_consolidation" {
  value = "${local.gcp_tier}"
}
output "server_add_disk_01" {
   value = "${local.server_add_disk_01}"
}