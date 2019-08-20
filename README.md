# terraform-aws-kinesis-stream

This module simplifies the creation of an Amazon Kinesis Stream which can be accessed by different AWS accounts.

## Examples
### Simple Example

```
module "kinesis-stream" {
  source                    = "git::https://github.com/bnc-projects/terraform-aws-kinesis-stream.git?ref=1.0.0"
  kinesis_stream_name       = "${var.kinesis_stream_name}"
  tags                      = "${merge(local.common_tags, var.tags)}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| kinesis_stream_name | A name to identify the stream | string | - | yes |
| shard_count | The number of shards that the stream will use | number | `1` | no |
| retention_period | Length of time data records are accessible after they are added to the stream | number | `24` | no |
| shard_level_metrics | A list of shard-level CloudWatch metrics which can be enabled for the stream | list | - | no |
| enforce_consumer_deletion | A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error | boolean | `false` | no |
| encryption_type | The encryption type to use | string | `KMS` | no |
| kms_key_id | he GUID for the customer-managed KMS key to use for encryption| string | `alias/aws/kinesis` | no |
| tags | A map of tags to add to the appropriate resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| kinesis_stream_url  | The Amazon Resource Name (ARN) specifying the Stream |
| kinesis_stream_name | The unique Stream name |
