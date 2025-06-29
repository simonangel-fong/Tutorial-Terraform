# ##########################################################
# ECS Task Definition
# ##########################################################

resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "${var.app_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "nginx"
      image     = "nginx:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

    }
  ])

  tags = {
    Name = "${var.app_name}-task"
  }
}

# ##########################################################
# Create ECS cluster
# ##########################################################

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.app_name}-cluster"

  tags = {
    Name = "${var.app_name}-cluster"
  }
}


# ##########################################################
# ECS Service
# ##########################################################

resource "aws_ecs_service" "nginx_service" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.nginx_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = "nginx"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.lb_listener]

  tags = {
    Name = "${var.app_name}-service"
  }
}






# # # # capacity providers
# # # resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {
# # #   name = "test1"

# # #   auto_scaling_group_provider {
# # #     auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn

# # #     managed_scaling {
# # #       maximum_scaling_step_size = 1000
# # #       minimum_scaling_step_size = 1
# # #       status                    = "ENABLED"
# # #       target_capacity           = 3
# # #     }
# # #   }

# # #   tags = {
# # #     Name     = "ecs_capacity_provider",
# # #     Resource = "ECS capacity provider"
# # #   }
# # # }

# # # # bind cluster capacity provider with cluster
# # # resource "aws_ecs_cluster_capacity_providers" "example" {
# # #   cluster_name = aws_ecs_cluster.ecs_cluster.name

# # #   capacity_providers = [aws_ecs_capacity_provider.ecs_capacity_provider.name]

# # #   default_capacity_provider_strategy {
# # #     base              = 1
# # #     weight            = 100
# # #     capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
# # #   }
# # # }


