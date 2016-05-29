# {{ ansible_managed }}

#
# https://www.vaultproject.io/docs/config/index.html#file
#

backend "consul" {
  address = "127.0.0.1:8500"
  path    = "vault"
  scheme  = "http"
}

#backend "file" {
#  path = "/var/lib/vault/backend.file"
#}

#backend "inmem" {
#}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}

#telemetry {
#  statsite_address = "127.0.0.1:8125"
#  disable_hostname = true
#}
