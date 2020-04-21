################################
#SNS Topic                    ##
################################

resource "aws_sns_topic" "webapp_production_autoscaling_topic" {
  display_name = "WebApp-AutoScaling-Topic"
  name = "WebApp-AutoScaling-Topic"
}

resource "aws_sns_topic_subscription" "webapp_production_autoscaling_sns_subcription" {
  endpoint = "arn:aws:lambda:us-east-2:552086789601:function:ServerlessExample"
  protocol = "lambda"
  topic_arn = aws_sns_topic.webapp_production_autoscaling_topic.arn
}

################################
#ASG Notification             ##
################################

resource "aws_autoscaling_notification" "webapp_autoscaling_notification" {
  group_names = [aws_autoscaling_group.ec2_public_asg.name]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR"
  ]
  topic_arn = aws_sns_topic.webapp_production_autoscaling_topic.arn
}





//resource "aws_sns_topic" "backend_production_autoscaling_topic" {
//  display_name = "WebApp-AutoScaling-Topic"
//  name = "WebApp-AutoScaling-Topic"
//}