resource "prismacloud_policy" "example_policy" {
    name = "EC2 Volumes with unencrypted volumes"
    policy_type = "config"
    description = "This is a test of Terraform source-controlled Prisma policies"
    severity = "low"
    cloud_type = "aws"
    rule {
        name = "rule"
        criteria = "prismacloud_saved_search.example.search_id"
        parameters = {
            "savedSearch": "true",
            "withIac": "false",
        }
        rule_type = "Config"
    }
}
