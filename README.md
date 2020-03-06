# terraform-aws-kinesis

This module provides the ability to create a Amazon Kinesis Data Stream.

## Examples
### Simple Example to create Kinesis Stream

```
module "kinesis-stream" {
  source                    = "git::https://github.com/bnc-projects/terraform-aws-kinesis.git?ref=1.0.0"
  kinesis_stream_name       = "var.kinesis_stream_name"
  tags                      = "merge(local.common_tags, var.tags)"
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alarm_actions | Actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN) | list | `[]` | no |
| aws_account_id | The aws account id that creates resources | string | `""` | no |
| encryption_type | The encryption type to use | string | `KMS` | no |
| kinesis_stream_name | A name to identify the kinesis stream | string | - | yes |
| kms_key_id | he GUID for the customer-managed KMS key to use for encryption| string | `alias/aws/kinesis` | no |
| retention_period | Length of time data records are accessible after they are added to the stream | number | `24` | no |
| read_throughput_evaluation_periods | The number of periods over which data is compared to the specified threshold.| number | `1` | no |
| read_throughput_period | The period in seconds over which the specified statistic is applied | number | `60` | no |
| read_throughput_statistic | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum| string | `Average` | no |
| read_throughput_threshold | The value against which the specified statistic is compared | number | `0` | no |
| shard_count | The number of shards that the stream will use | number | `1` | no |
| shard_level_metrics | A list of shard-level CloudWatch metrics which can be enabled for the stream | list | - | no |
| tags | A map of tags to add to the appropriate resources | map | `<map>` | no |
| write_throughput_evaluation_periods | The number of periods over which data is compared to the specified threshold | number | `1` | no |
| write_throughput_period | The period in seconds over which the specified statistic is applied.| number | `60` | no |
| write_throughput_statistic | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum| string | `Average` | no |
| write_throughput_threshold | The value against which the specified statistic is compared | number | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| kinesis_stream_arn | The Amazon Resource Name (ARN) specifying the Kinesis Stream |
| kinesis_stream_name | The unique Kinesis Stream name |