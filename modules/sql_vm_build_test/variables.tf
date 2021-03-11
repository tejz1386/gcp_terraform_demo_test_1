variable  "csv_input_file_name" {}
variable  "csv_input_storage_file_name" {}
variable "st_key" {
    type = string
    default = ""
}
variable "st_values" {
    type = list(string)
    default = []
}