resource "aws_iam_role" "kinesis_stream_role" {
  name = format("%s-kinesis-stream-role", var.firehose_name)
  assume_role_policy = data.aws_iam_policy_document.read_from_kinesis_stream.json
  tags = var.tags

}

data "aws_iam_policy_document" "read_from_kinesis_stream" {

  statement {
    sid    = "AllowFirehoseToReadDataFromKinesisStream"
    effect = "Allow"

    actions = [
      "kinesis:DescribeStream",
      "kinesis:GetShardIterator",
      "kinesis:GetRecords"
    ]

    resources = [
      aws_kinesis_stream.default.arn
    ]
  }
}

resource "aws_iam_role" "s3_iam_role" {
  name = format("%s-s3-role", var.firehose_name)
  assume_role_policy = data.aws_iam_policy_document.delivey_to_s3.json
  tags = var.tags
}

data "aws_iam_policy_document" "delivey_to_s3" {

  statement {
    sid    = "AllowFirehoseToDeliveryToS3"
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
    ]

    resources = [
      var.s3_bucket_arn
    ]
  }
}

resource "aws_iam_role" "cloudwatch_role" {
  name = format("%s-cloudwatch-role", var.firehose_name)
  assume_role_policy = data.aws_iam_policy_document.send_cloudwatch_log.json
  tags = var.tags
}

data "aws_iam_policy_document" "send_cloudwatch_log" {

  statement {
    sid    = "AllowFirehoseToSendCloudwatchLog"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "*"
    ]
  }
}