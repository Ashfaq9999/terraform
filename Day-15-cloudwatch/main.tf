resource "aws_cloudwatch_dashboard" "example_dashboard" {
  dashboard_name = "MyDashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 6
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", "i-001e595aa3ca555c4"]
          ]
          period     = 300
          stat       = "Average"
          region     = "ap-south-1"
          title      = "EC2 CPU Utilization"
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 0
        width  = 6
        height = 6
        properties = {
          metrics = [
            ["AWS/Lambda", "Invocations", "FunctionName", "my-lambda-function"]
          ]
          period     = 60
          stat       = "Sum"
          region     = "ap-south-1"
          title      = "Lambda Invocations"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 6
        height = 6
        properties = {
          metrics = [
            ["AWS/S3", "BucketSizeBytes", "StorageType", "StandardStorage", "BucketName", "mys3bucket"]
          ]
          period     = 86400
          stat       = "Average"
          region     = "ap-south-1"
          title      = "S3 Bucket Size (Bytes)"
        }
      }
    ]
  })
}
