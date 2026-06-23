# IP publique IPv4 de l'instance
output "instance_ip" {
  description = "Adresse IPv4 publique de l'instance"
  value = one([
    for address in ovh_cloud_project_instance.tp_instance.addresses :
    address.ip if tostring(address.version) == "4"
  ])
}

# Toutes les adresses IP de l'instance
output "instance_addresses" {
  description = "Toutes les adresses IP de l'instance"
  value       = ovh_cloud_project_instance.tp_instance.addresses
}

# Nom de l'instance
output "instance_name" {
  description = "Nom de l'instance déployée"
  value       = ovh_cloud_project_instance.tp_instance.name
}

# Région
output "region" {
  description = "Région OVHcloud"
  value       = var.region
}

# ID de l'instance
output "instance_id" {
  description = "Identifiant unique de l'instance OVHcloud"
  value       = ovh_cloud_project_instance.tp_instance.id
}