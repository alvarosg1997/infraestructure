variable "digitalocean_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}
variable "image_tag" {
  description = "Tag de la imagen Docker"
  type        = string
}   