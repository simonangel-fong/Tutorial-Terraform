# # Secure Group
# resource "aws_security_group" "ecs_sg" {
#   name   = "ecs-security-group"
#   vpc_id = aws_vpc.tf_vpc.id

#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     self        = "false"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Accept any inbound traffic"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Accept any outbound traffic"
#   }

#   tags = {
#     Name     = "ecs_sg",
#     Resource = "Secure Group"
#   }
# }

# # launch template
# resource "aws_launch_template" "ecs_lt" {
#   name_prefix   = "ecs-template"
#   image_id      = var.ami_id
#   instance_type = var.ec2_instance_type

#   key_name               = var.key_pair
#   vpc_security_group_ids = [aws_security_group.ecs_sg.id]
#   iam_instance_profile {
#     name = var.ecs_iam_role
#   }

#   block_device_mappings {
#     device_name = "/dev/xvda"
#     ebs {
#       volume_size = 30
#       volume_type = "gp2"
#     }
#   }

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "ecs-instance"
#     }
#   }

#   user_data = filebase64("${path.module}/ecs.sh")

#   tags = {
#     Name     = "ecs_launch_template",
#     Resource = "ECS instance launch template"
#   }
# }

# # auto-scaling group (ASG)
# resource "aws_autoscaling_group" "ecs_asg" {
#   vpc_zone_identifier = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
#   desired_capacity    = 2
#   max_size            = 3
#   min_size            = 1

#   launch_template {
#     id      = aws_launch_template.ecs_lt.id
#     version = "$Latest"
#   }

#   tag {
#     key                 = "AmazonECSManaged"
#     value               = true
#     propagate_at_launch = true
#   }
# }

# # ALB
# resource "aws_lb" "ecs_alb" {
#   name               = "ecs-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.ecs_sg.id]
#   subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

#   tags = {
#     Name     = "ecs-alb",
#     Resource = "Application Load Balancer"
#   }
# }

# resource "aws_lb_target_group" "ecs_tg" {
#   name        = "ecs-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = aws_vpc.tf_vpc.id

#   health_check {
#     path = "/"
#   }

#   tags = {
#     Name     = "ecs-target-group",
#     Resource = "Target group"
#   }
# }

# resource "aws_lb_listener" "ecs_alb_listener" {
#   load_balancer_arn = aws_lb.ecs_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs_tg.arn
#   }

#   tags = {
#     Name     = "ecs_alb_listener",
#     Resource = "ALB listener"
#   }
# }


