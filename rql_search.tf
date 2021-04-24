resource "prismacloud_saved_search" "uv_ss" {
    name = "TF - Unencrypted EC2 Volumes - $${random_string.suffix}"
    description = "Unencrypted EC2 Volumes - Managed by Terraform"
    search_id = prismacloud_rql_search.uv_rql.search_id
    query = prismacloud_rql_search.uv_rql.query
    time_range {
        relative {
            unit = prismacloud_rql_search.uv_rql.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.uv_rql.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "uv_rql" {
    search_type = "config"
    query = "config from cloud.resource where cloud.type = 'aws' AND api.name = 'aws-ec2-describe-volumes' AND json.rule = 'encrypted is false'"
    time_range {
        relative {
            unit = "hour"
            amount = 24
        }
    }
}
