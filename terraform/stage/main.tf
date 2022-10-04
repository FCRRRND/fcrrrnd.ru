resource "yandex_vpc_network" "default" {
}

resource "yandex_vpc_subnet" "public-subnet" {
  name           = "public-subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["10.10.10.0/24"]
}

resource "yandex_vpc_subnet" "private-subnet" {
  name           = "private-subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["10.10.20.0/24"]
  route_table_id = "${yandex_vpc_route_table.private-nat.id}"
}

resource "yandex_vpc_route_table" "private-nat" {
  network_id = "${yandex_vpc_network.default.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "10.10.10.10"
  }
}

resource "tls_private_key" "deploy_key" {
  algorithm    = "ED25519"
}
