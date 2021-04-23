resource "prismacloud_saved_search" "example" {
    name = "TF - EC2 Volumes are unencrypted"
    description = "Made by Terraform"
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
    query = "config from cloud.resource where cloud.type = 'aws' AND api.name = 'aws-ec2-describe-volumes' AND json.rule = 'encrypted is false'"
    time_range {
        relative {
            unit = "hour"
            amount = 24
        }
    }
}
