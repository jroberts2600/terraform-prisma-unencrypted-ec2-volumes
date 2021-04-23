resource "prismacloud_saved_search" "terraform_example" {
    name = "Made by Terraform"
    description = "made by terraform"
    search_id = prismacloud_rql_search.terraform_example.search_id
    query = prismacloud_rql_search.terraform_example.query
    time_range {
        relative {
            unit = prismacloud_rql_search.terraform_example.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.terraform_example.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "terraform_example" {
    search_type = "config"
    query = "config from cloud.resource where cloud.type = 'aws' AND api.name = 'aws-ec2-describe-volumes' AND json.rule = 'encrypted is false'"
    time_range {
        relative {
            unit = "hour"
            amount = 24
        }
    }
}