variable "kinesis_stream_name" {
  type        = string
  description = "The name of the kinesis stream"
}

variable "shard_count" {
  description = "The number of shards that the stream will use"
  default     = 1
  type        = number
}

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream"
  default     = 24
  type        = number
}

variable "shard_level_metrics" {
  description = " A list of shard-level CloudWatch metrics which can be enabled for the stream"
  type        = list
  default     = []
}

variable "encryption_type" {
  type        = string
  default     = "KMS"
  description = "The encryption type to use"
}

variable "kms_key_id" {
  type        = string
  default     = "alias/aws/kinesis"
  description = "The GUID for the customer-managed KMS key to use for encryption"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "read_throughput_exceeded_name" {
  type        = string
  description = "The descriptive name for the alarm."
}

variable "write_throughput_exceeded_name" {
  type        = string
  description = "The descriptive name for the alarm."
}

variable "read_throughput_comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
  default     = "GreaterThanThreshold"
}

variable "write_throughput_comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold."
  default     = "GreaterThanThreshold"
}

variable "read_throughput_evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 1
}

variable "write_throughput_evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 1
}

variable "read_throughput_metric_name" {
  type        = string
  description = "The name for the alarm's associated metric. See docs for supported metrics."
  default     = "ReadProvisionedThroughputExceeded"
}

variable "write_throughput_metric_name" {
  type        = string
  description = "The name for the alarm's associated metric. See docs for supported metrics."
  default     = "WriteProvisionedThroughputExceeded"
}

variable "read_throughput_namespace" {
  type        = string
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces."
  default     = "AWS/Kinesis"
}

variable "write_throughput_namespace" {
  type        = string
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces."
  default     = "AWS/Kinesis"
}

variable "read_throughput_period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = 60
}

variable "write_throughput_period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = 60
}

variable "read_throughput_statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Average"
}

variable "write_throughput_statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Average"
}

variable "read_throughput_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared."
  default     = 0
}

variable "write_throughput_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared."
  default     = 0
}

variable "read_throughput_alarm_description" {
  type        = string
  description = "alarm description"
  default     = "Alarm when read throughput is exceeded"
}

variable "write_throughput_alarm_description" {
  type        = string
  description = "alarm description"
  default     = "Alarm when write throughput is exceeded"
}

variable "read_throughput_alarm_actions" {
  type        = list
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = []
}

variable "write_throughput_alarm_actions" {
  type        = list
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = []
}

variable "read_throughput_dimensions" {
  type        = map
  description = "The dimensions for the alarm's associated metric."
  default     = {}
}

variable "write_throughput_dimensions" {
  type        = map
  description = "The dimensions for the alarm's associated metric."
  default     = {}
}

variable "read_throughput_treat_missing_data" {
  type        = string
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing"
  default     = "missing"
}

variable "write_throughput_treat_missing_data" {
  type        = string
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing"
  default     = "missing"
}

variable "sns_topic_name" {
  type        = string
  description = "The friendly name for the SNS topic."
}

variable "lambda_endpoint" {
  type        = string
  description = "The endpoint to send data to, the contents will vary with the protocol"
}

variable "create_read_throughput_alarm" {
  type        = bool
  description = "If this property is set to true, create an alarm for kinesis read throughput exceed metric, otherwise no."
  default     = true
}

variable "create_write_throughput_alarm" {
  type        = bool
  description = "If this property is set to true, create an alarm for kinesis write throughput exceed metric, otherwise no."
  default     = true
}

variable "create_sns_topic" {
  type        = bool
  description = "If this property is set to true, create a SNS topic, otherwise no."
  default     = false
}

variable "create_sns_topic_subscription" {
  type        = bool
  description = "If this property is set to true, create a SNS topic subscription, otherwise no."
  default     = false
}






