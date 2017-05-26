provider "digitalocean" {
  # Set in .bashrc
  # DIGITALOCEAN_TOKEN="API TOKEN"
}
resource "digitalocean_droplet" "mywebserver" {
  ssh_keys           = []         # TODO: https://developers.digitalocean.com/documentation/v2/#list-all-keys
  image              = "${var.image}"
  region             = "${var.region}"
  size               = "${var.size}"
  private_networking = true
  backups            = "${var.backups}"
  ipv6               = "${var.ipv6}"
  name               = "${var.name}"
  user_data          = "${file("userdata.sh")}"
}
#TODO:
/*resource "digitalocean_domain" "mywebserver" {
  name       = "www.mywebserver.com"
  ip_address = "${digitalocean_droplet.mywebserver.ipv4_address}"
}

resource "digitalocean_record" "mywebserver" {
  domain = "${digitalocean_domain.mywebserver.name}"
  type   = "A"
  name   = "mywebserver"
  value  = "${digitalocean_droplet.mywebserver.ipv4_address}"
}*/
