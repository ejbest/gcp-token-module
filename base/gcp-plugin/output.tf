output "vault_gcp_secret_backend" {
  value = vault_gcp_secret_backend.gcp.path
}

output "vault_gcp_secret_roleset" {
  value = vault_gcp_secret_roleset.vault_gcp_secret_roleset.roleset
}
