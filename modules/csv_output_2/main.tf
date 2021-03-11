locals {
  storage_data = "${csvdecode(file(var.csv_input_storage_file_name))}"
}
    data "null_data_source" "csv_file" {
      inputs = {
        file_data = "${chomp(file(var.csv_input_storage_file_name))}"
               }
}

resource "null_resource" "csv_interpolation_method" {
  count = length(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))))

triggers = {
    01 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 0)}"
    02 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 1)}"
    03 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 2)}"
    04 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 3)}"
    05 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 4)}"
    06 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 5)}"
    07 = "${element(split(",", element(slice(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")), 1, length(split("\n", lookup(data.null_data_source.csv_file.outputs, "file_data")))), count.index)), 6)}"

  }
}

locals {
  gcp_vm_name           = null_resource.csv_interpolation_method.*.triggers.01
  gcp_vm_disk1          = null_resource.csv_interpolation_method.*.triggers.02
  gcp_vm_disk2          = null_resource.csv_interpolation_method.*.triggers.03
  gcp_vm_disk3          = null_resource.csv_interpolation_method.*.triggers.04
  gcp_vm_disk4          = null_resource.csv_interpolation_method.*.triggers.05
  gcp_zone              = null_resource.csv_interpolation_method.*.triggers.06
  gcp_tier              = null_resource.csv_interpolation_method.*.triggers.07
  server_disk_01        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk1}")
  server_disk_02        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk2}")
  server_disk_03        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk3}")
  server_disk_04        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk4}")
  server_zone           = zipmap("${local.gcp_vm_name}","${local.gcp_zone}")
  server_tier           = zipmap("${local.gcp_vm_name}","${local.gcp_tier}")
  # server_disk_05        = zipmap("${local.gcp_vm_name}","${local.gcp_vm_disk5}")

}

output "server_disk1_consolidation" {
  value = "${local.server_disk_01}"
}
output "server_disk2_consolidation" {
  value = "${local.server_disk_02}"
}
output "server_disk3_consolidation" {
  value = "${local.server_disk_03}"
}
output "server_disk4_consolidation" {
  value = "${local.server_disk_04}"
}
output "server_zone_consolidation" {
  value = "${local.server_zone}"
}
output "server_tier_consolidation" {
  value = "${local.server_tier}"
}