
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/drupal"
  retention_in_days = 7
}

resource "aws_iam_role_policy_attachment" "ecs_logs" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
