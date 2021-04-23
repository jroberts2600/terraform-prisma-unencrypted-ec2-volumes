resource "prismacloud_policy" "test_policy" {
    name = "test_policy"
    policy_type = "config"
    description = "This is a test of Terraform source-controlled Prisma policies"
    severity = "low"
    cloud_type = "aws"
    rule {
        name = "test_policy"
        criteria = prismacloud_saved_search.terraform_example.search_id
        parameters = {
            "savedSearch": "true",
            "withIac": "false",
        }
        rule_type = "Config"
    }
}
