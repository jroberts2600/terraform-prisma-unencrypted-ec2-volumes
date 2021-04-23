resource "prismacloud_saved_search" "example_search" {
    name = "TF - Example Saved Search"
    description = "TF - Example Saved Search"
    search_id = prismacloud_rql_search.unencrypted_ec2_rql.search_id
    query = prismacloud_rql_search.unencrypted_ec2_rql.query
    time_range {
        relative {
            unit = prismacloud_rql_search.unencrypted_ec2_rql.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.unencrypted_ec2_rql.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "unencrypted_ec2_rql" {
    search_type = "config"
    query = "config from cloud.resource where cloud.type = 'aws' AND api.name = 'aws-ec2-describe-volumes' AND json.rule = 'encrypted is false'"
    time_range {
        relative {
            unit = "hour"
            amount = 24
        }
    }
}
