resource "prismacloud_policy" "uv_policy" {
  name = "test_policy"
  policy_type = "config"
  description = "Unencrypted EC2 Volumes - TF Managed"
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

