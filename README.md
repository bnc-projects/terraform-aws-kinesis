# terraform-aws-kinesis

This module simplifies the creation of an Amazon Kinesis Stream which can be accessed by different AWS accounts.

## Examples
### Simple Example

```
module "kinesis-stream" {
  source                    = "git::https://github.com/bnc-projects/terraform-aws-kinesis.git?ref=1.0.0"
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
| encryption_type | The encryption type to use | string | `KMS` | no |
| kms_key_id | he GUID for the customer-managed KMS key to use for encryption| string | `alias/aws/kinesis` | no |
| tags | A map of tags to add to the appropriate resources | map | `<map>` | no |
| read_throughput_exceeded_name | The descriptive name for the alarm.| string | none | no |
| write_throughput_exceeded_name | The descriptive name for the alarm.| string | none | no |
| read_throughput_comparison_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold.| string | `GreaterThanThreshold` | yes |
| write_throughput_comparison_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold.| string | `GreaterThanThreshold` | yes |
| read_throughput_evaluation_periods | The number of periods over which data is compared to the specified threshold.| number | 1 | yes |
| write_throughput_evaluation_periods | The number of periods over which data is compared to the specified threshold.| number | 1 | yes |
| read_throughput_metric_name | The name for the alarm's associated metric. See docs for supported metrics.| string | `ReadProvisionedThroughputExceeded` | yes |
| write_throughput_metric_name | The name for the alarm's associated metric. See docs for supported metrics.| string | `ReadProvisionedThroughputExceeded` | yes |
| read_throughput_namespace | The namespace for the alarm's associated metric. See docs for the list of namespaces.| string | `AWS/Kinesis` | yes |
| write_throughput_namespace | The namespace for the alarm's associated metric. See docs for the list of namespaces.| string | `AWS/Kinesis` | yes |
| read_throughput_period | The period in seconds over which the specified statistic is applied.| number | 60 | yes |
| write_throughput_period | The period in seconds over which the specified statistic is applied.| number | 60 | yes |
| read_throughput_statistic | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum| string | `Average` | yes |
| write_throughput_statistic | The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum| string | `Average` | yes |
| read_throughput_threshold | The value against which the specified statistic is compared.| number | 0 | yes |
| write_throughput_threshold | The value against which the specified statistic is compared.| number | 0 | yes |
| read_throughput_alarm_description | alarm description| string | none | no |
| write_throughput_alarm_description | alarm description| string | none | no |
| read_throughput_alarm_actions | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN).| list |[] | yes |
| write_throughput_alarm_actions | The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN).| list |[] | yes |
| read_throughput_dimensions | The dimensions for the alarm's associated metric. | map | {} | yes |
| write_throughput_dimensions | The dimensions for the alarm's associated metric. | map | {} | yes |
| read_throughput_treat_missing_data | Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing | string | `missing` | yes |
| write_throughput_treat_missing_data | Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing | string | `missing` | yes |
| sns_topic_name |  The friendly name for the SNS topic. | string | none | yes |
| lambda_endpoint |  The endpoint to send data to, the contents will vary with the protocol | string | none | yes |
| create_read_throughput_alarm |  If this property is set to true, create an alarm for kinesis read throughput exceed metric, otherwise no. | bool | true | yes |
| create_write_throughput_alarm |  If this property is set to true, create an alarm for kinesis write throughput exceed metric, otherwise no. | bool | true | yes |
| create_sns_topic |  If this property is set to true, create a SNS topic, otherwise no. | bool | false | yes |
| create_sns_topic_subscription|  If this property is set to true, create a SNS topic subscription, otherwise no. | bool | false | yes |

## Outputs

| Name | Description |
|------|-------------|
| kinesis_stream_url  | The Amazon Resource Name (ARN) specifying the Stream |
| kinesis_stream_name | The unique Stream name |
| read_throughout_exceed_alarm_name | name of alarm e.g. `aws_cloudwatch_metric_alarm.read_throughput_exceeded.arn` |
| write_throughout_exceed_alarm_name | write throughput exceeded e.g. `aws_cloudwatch_metric_alarm.write_throughput_exceeded.arn` |
| topic_arn | topic arn |

