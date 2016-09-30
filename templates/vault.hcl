# {{ ansible_managed }}

#
# https://www.vaultproject.io/docs/config/index.html#file
#

backend "consul" {
  address = "{{ vault_backend_consul_address }}"
  path    = "vault"
  disable_clustering = "{{ vault_disable_clustering | lower }}"
{% if not vault_disable_clustering %}
  cluster_addr = "{{ vault_cluster_addr }}"
{% endif %}
}

#backend "file" {
#  path = "/var/lib/vault/backend.file"
#}

#backend "inmem" {
#}

listener "tcp" {
  address     = "{{ vault_listener_address }}"
{% if not vault_disable_clustering %}
  cluster_address     = "{{ vault_listener_cluster_address }}"
{% endif %}
  tls_disable = 1
}

#telemetry {
#  statsite_address = "127.0.0.1:8125"
#  disable_hostname = true
#}

default_lease_ttl = "{{ vault_default_lease_ttl }}"
max_lease_ttl = "{{ vault_max_lease_ttl }}"
