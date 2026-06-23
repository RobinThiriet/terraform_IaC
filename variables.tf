variable "ovh_project_id" {
  description = "Service Name du projet OVHcloud Public Cloud"
  type        = string
}

variable "region" {
  description = "Région OVHcloud cible"
  type        = string
  default     = "GRA11"
}

variable "instance_name" {
  description = "Nom de l'instance à créer"
  type        = string
  default     = "Robin-tp-jour1"
}

variable "flavor" {
  description = "Taille de l'instance OVHcloud"
  type        = string
  default     = "s1-4"
}

variable "image_name" {
  description = "Nom de l'image à utiliser"
  type        = string
  default     = "Ubuntu 22.04"
}

variable "author" {
  description = "Robin"
  type        = string
}

variable "ssh_key_name" {
  description = "Nom de la clé SSH OVHcloud"
  type        = string
  default     = "Robin"
}

variable "ssh_public_key_path" {
  description = "Chemin vers la clé publique SSH locale"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}