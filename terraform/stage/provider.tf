terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket = "fcrrrnd.ru"
    key    = "my-diplom/terraform.tfstate"
    region = "ru-central1-a"
    access_key = "YCAJEWHcZ7nHekIttL8pg5iTv"
    secret_key = "YCPf_zZxu3jFRc4sCFCpUnPDd370sKhQnGnp3Yds"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
