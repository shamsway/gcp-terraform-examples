provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  description             = var.network_descr
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_global_address" "private_ip_alloc_1" {
  name          = var.reserved1_name
  address       = var.reserved1_address
  purpose       = var.address_purpose
  address_type  = var.address_type
  prefix_length = var.reserved1_address_prefix_length
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_global_address" "private_ip_alloc_2" {
  name          = var.reserved2_name
  address       = var.reserved2_address
  purpose       = var.address_purpose
  address_type  = var.address_type
  prefix_length = var.reserved2_address_prefix_length
  network       = google_compute_network.vpc_network.id
}

resource "google_service_networking_connection" "gcve-psa" {
  network                 = google_compute_network.vpc_network.id
  service                 = var.service
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc_1.name, google_compute_global_address.private_ip_alloc_2.name]
  depends_on              = [google_compute_network.vpc_network]
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering              = var.peering
  network              = google_compute_network.vpc_network.name
  import_custom_routes = true
  export_custom_routes = true
  depends_on           = [google_service_networking_connection.gcve-psa]
}