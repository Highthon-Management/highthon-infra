resource "aws_ecs_cluster" "default" {
  name = "${var.app_name}-cluster"
  tags = {
    Name = "${var.app_name}-cluster"
    name = "2-2Admin"
  }
}

resource "aws_ecs_service" "default" {
  name = "${var.app_name}-service"
  cluster = aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.default.arn
  desired_count = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.http.arn
    container_name   = "${var.app_name}-container"
    container_port   = var.container_port
  }
  network_configuration {
    subnets          = [element(aws_subnet.private.*.id, var.az_count)]
    security_groups  = [aws_security_group.default.id]
  }
  health_check_grace_period_seconds = 300
  tags = {
    name = "2-2Admin"
  }
}

resource "aws_ecs_task_definition" "default" {
  family                = aws_ecs_cluster.default.name
  network_mode          = "awsvpc"
  tags = {
    name = "2-2Admin"
  }
  container_definitions = <<EOF
  [{
    "name": "${var.app_name}-container",
    "image": "${aws_ecr_repository.default.repository_url}",
    "cpu": 1024,
    "memory": 2048,
    "portMappings": [
      {
        "containerPort": ${var.container_port},
        "hostPort": ${var.container_port},
        "protocol": "tcp"
      }
    ]
  }]
  EOF
}
