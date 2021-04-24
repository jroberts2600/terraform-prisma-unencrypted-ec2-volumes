resource "prismacloud_policy" "uv_policy" {
  name = "TF - Unencrypted EC2 Volumes"
  policy_type = "config"
  description = "Unencrypted EC2 Volumes - Managed by Terraform"
  severity = "low"
  cloud_type = "aws"
  rule {
    name = "Unencrypted EC2 Volumes"
    criteria = prismacloud_saved_search.uv_ss.search_id
    parameters = {
      "savedSearch": "true",
      "withIac": "false",
    }
    rule_type = "Config"
  }
}

