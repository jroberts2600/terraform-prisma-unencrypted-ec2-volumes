resource "prismacloud_saved_search" "unencrypted_ec2_volumes_ss" {
    name = "TF - EC2 Unencrypted Volumes"
    description = "Manged by Terraform"
    search_id = prismacloud_rql_search.unencrypted_ec2_volumes.search_id
    query = prismacloud_rql_search.unencrypted_ec2_volumes.query
    time_range {
        relative {
            unit = prismacloud_rql_search.unencrypted_ec2_volumes.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.unencrypted_ec2_volumes.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "unencrypted_ec2_volumes" {
    search_type = "config"
    query = "config from cloud.resource where cloud.type = 'aws' AND api.name = 'aws-ec2-describe-volumes' AND json.rule = 'encrypted is false'"
    time_range {
        relative {
            unit = "hour"
            amount = 24
        }
    }
}
