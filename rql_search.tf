resource "prismacloud_saved_search" "example" {
    name = "Made by Terraform"
    description = "made by terraform"
    search_id = prismacloud_rql_search.x.search_id
    query = prismacloud_rql_search.x.query
    time_range {
        relative {
            unit = prismacloud_rql_search.x.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.x.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "x" {
    search_type = "config"
    query = "config from cloud.resource where api.name = 'aws-ec2-describe-instances'"
    time_range {
        relative {
            unit = "hour"
            amount = 24
        }
    }
}
