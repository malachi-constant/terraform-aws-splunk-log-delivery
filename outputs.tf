output "cloudwatch_destination_arn" {
  value = aws_cloudwatch_log_destination.this.arn
}

output "firehose_stream_arn" {
  value = aws_kinesis_firehose_delivery_stream.this.arn
}

output "lambda_function_arn" {
  value = aws_lambda_function.this.arn
}

output "failure_bucket" {
  value = aws_s3_bucket.failures.id
}
