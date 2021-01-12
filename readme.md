# Usage
__example:__
```

module "splunk_delivery" {
  source           = "../splunk-delivery"
  splunk_hec_url   = var.splunk_hec_url
  splunk_hec_token = var.splunk_hec_token
  prefix           = "test"
}
```

see `./tests/example.tf`

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_log\_retention | Length in days to keep CloudWatch logs of Kinesis Firehose | `number` | `30` | no |
| enable\_fh\_cloudwatch\_logging | Enable kinesis firehose CloudWatch logging. (It only logs errors) | `bool` | `true` | no |
| hec\_acknowledgment\_timeout | The amount of time, in seconds between 180 and 600, that Kinesis Firehose waits to receive an acknowledgment from Splunk after it sends it data. | `number` | `300` | no |
| hec\_endpoint\_type | Splunk HEC endpoint type; `Raw` or `Event` | `string` | `"Raw"` | no |
| kinesis\_firehose\_buffer | https://www.terraform.io/docs/providers/aws/r/kinesis_firehose_delivery_stream.html#buffer_size | `number` | `5` | no |
| kinesis\_firehose\_buffer\_interval | Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination | `number` | `300` | no |
| memory\_size | Timeout value for Lambda function | `number` | `256` | no |
| nodejs\_runtime | Runtime version of nodejs for Lambda function | `string` | `"nodejs12.x"` | no |
| prefix | Prefix for naming resources | `string` | `"splunk-test"` | no |
| s3\_backup\_mode | Defines how documents should be delivered to Amazon S3. Valid values are FailedEventsOnly and AllEvents. | `string` | `"FailedEventsOnly"` | no |
| s3\_compression\_format | The compression format for what the Kinesis Firehose puts in the s3 bucket | `string` | `"GZIP"` | no |
| s3\_prefix | Optional prefix (a slash after the prefix will show up as a folder in the s3 bucket).  The YYYY/MM/DD/HH time format prefix is automatically used for delivered S3 files. | `string` | `"kinesis-firehose/"` | no |
| sender\_account\_ids | List of AWS account ids to allow subscription to cloudwatch destination. | `list` | `[]` | no |
| splunk\_hec\_token | Splunk security token needed to submit data to Splunk | `any` | n/a | yes |
| splunk\_hec\_url | Splunk Kinesis URL for submitting CloudWatch logs to splunk | `any` | n/a | yes |
| tags | Map of tags to put on the resource | `map(string)` | `{}` | no |
| timeout | Timeout value for Lambda function | `number` | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_destination\_arn | n/a |
| failure\_bucket | n/a |
| firehose\_stream\_arn | n/a |
| lambda\_function\_arn | n/a |
