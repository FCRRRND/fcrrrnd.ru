# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1ghgt8sag7lv475qqqm"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1g5q4428ibmbsnf8rh9"
}

variable "yandex_external_ip" {
  default = "84.201.174.143"
}

variable "yandex_ubuntu_user" {
  default = "ubuntu"
}

variable "yandex_centos_user" {
  default = "centos"
}
