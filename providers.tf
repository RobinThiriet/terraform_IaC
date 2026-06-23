provider "ovh" {
  # Endpoint européen OVHcloud
  # Les credentials sont automatiquement lus depuis :
  #   OVH_APPLICATION_KEY
  #   OVH_APPLICATION_SECRET
  #   OVH_CONSUMER_KEY
  endpoint = "ovh-eu"
}
provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/"    # URL d'authentification
  domain_name = "default"                           # Nom de domaine - Toujours à "default" pour OVHcloud
  alias       = "ovh"                               # Un alias
}