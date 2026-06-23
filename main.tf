# ─── DATA SOURCE : flavors disponibles sur OVHcloud ──────────────────────────
data "ovh_cloud_project_flavors" "flavors" {
  service_name = var.ovh_project_id
  region       = var.region
}

# ─── DATA SOURCE : images Ubuntu disponibles sur OVHcloud ────────────────────
data "ovh_cloud_project_images" "images" {
  service_name = var.ovh_project_id
  region       = var.region
}

# ─── LOCALS : résolution du flavor ID et de l'image ID par leur nom ──────────
locals {
  flavor = one([
    for f in data.ovh_cloud_project_flavors.flavors.flavors :
    f if f.name == var.flavor
  ])

  image = one([
    for i in data.ovh_cloud_project_images.images.images :
    i if i.name == var.image_name
  ])
}
# ─── RESOURCE : instance OVHcloud Public Cloud ───────────────────────────────
resource "ovh_cloud_project_instance" "tp_instance" {
  service_name   = var.ovh_project_id
  name           = var.instance_name
  region         = var.region
  billing_period = "hourly"

  boot_from {
    image_id = local.image.id
  }

  flavor {
    flavor_id = local.flavor.id
  }

  ssh_key_create {
    name       = var.ssh_key_name
    public_key = file(pathexpand(var.ssh_public_key_path))

  }

  network {
    public = true
  }
}