resource "vault_gcp_secret_backend" "gcp" {
  credentials = file("${var.vault_gcp_crentials}")
  description = "GCP secrets engine for issuing temporary credentials"
}

# Create a roleset in Vault for generating GCP access tokens
resource "vault_gcp_secret_roleset" "vault_gcp_secret_roleset" {
  depends_on   = [vault_gcp_secret_backend.gcp]
  backend      = "gcp"
  roleset      = var.vault_gcp_roleset_name
  project      = var.gcp_project_id
  secret_type  = "access_token"
  token_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

  binding {
    resource = "//cloudresourcemanager.googleapis.com/projects/${var.gcp_project_id}"

    roles = [
      "roles/editor",
    ]
  }
}
