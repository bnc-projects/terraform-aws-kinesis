resource "aws_iam_role" "firehose_access_role" {
  count       = var.create_firehose == false ? 0 : 1
  name = format("%s-kinesis-stream-role", var.kinesis-firehose_name)
  assume_role_policy = data.aws_iam_policy_document.read_from_kinesis_stream[0].json
  tags = var.tags

}

data "aws_iam_policy_document" "read_from_kinesis_stream" {
  count       = var.create_firehose == false ? 0 : 1
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

resource "aws_iam_role" "firehose_delivery_role" {
  count       = var.create_firehose == false ? 0 : 1
  name = format("%s-s3-role", var.kinesis-firehose_name)
  assume_role_policy = data.aws_iam_policy_document.firehose_delivery_policy[0].json
  tags = var.tags
}

data "aws_iam_policy_document" "firehose_delivery_policy" {
  count       = var.create_firehose == false ? 0 : 1
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