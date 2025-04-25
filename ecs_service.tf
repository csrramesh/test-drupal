
resource "aws_ecs_service" "drupal" {
  name            = "drupal-service"
  cluster         = aws_ecs_cluster.drupal.id
  task_definition = aws_ecs_task_definition.drupal.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.public_a.id, aws_subnet.public_b.id]
    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.drupal_tg.arn
    container_name   = "drupal"
    container_port   = 80
  }
  depends_on = [aws_lb_listener.http]
}
