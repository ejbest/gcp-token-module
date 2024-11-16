resource "vault_mount" "vault_mount" {
  path        = var.vault_mount_path
  type        = var.vault_mount_type
  description = var.vault_mount_description
}

data "local_file" "vault_secret_file" {
  filename = var.vault_secret_data_file
}

resource "vault_kv_secret_v2" "vault_secret_data_literal" {
  depends_on = [vault_mount.vault_mount]
  mount      = vault_mount.vault_mount.path
  name       = var.vault_secret_path

  data_json = data.local_file.vault_secret_file.content

}
