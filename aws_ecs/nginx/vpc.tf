resource "aws_vpc" "app-vpc" {
  cidr_block           = var.vpc_cidr # Refer var
  enable_dns_hostnames = true

  tags = {
    Name = "app-vpc"
  }
}

# ########################################################
# Public Subnets 
# ########################################################

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = cidrsubnet(aws_vpc.app-vpc.cidr_block, 8, 1)
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.app-vpc]

  tags = {
    Name = "app-subnet_a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = cidrsubnet(aws_vpc.app-vpc.cidr_block, 8, 2)
  availability_zone       = var.az_b
  map_public_ip_on_launch = true

  depends_on = [aws_vpc.app-vpc]

  tags = {
    Name = "app-subnet_b"
  }
}

# ##########################################################
# Internet Gateway
# ##########################################################

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.app-vpc.id

  depends_on = [aws_vpc.app-vpc]

  tags = {
    Name = "app-igw",
  }
}

# ##########################################################
# Route table
# ##########################################################
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.app-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  depends_on = [aws_vpc.app-vpc]

  tags = {
    Name = "route_table"
  }
}

# ##########################################################
# Associate net gateway with subnet
# ##########################################################

resource "aws_route_table_association" "subnet_a_route" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet_b_route" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

# ##########################################################
# Security Group
# ##########################################################

# For ALB
resource "aws_security_group" "alb_sg" {
  name        = "${var.app_name}-alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.app-vpc.id

  # inbound Internet http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound any
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-alb-sg"
  }
}

# Security Group for ECS
resource "aws_security_group" "ecs_sg" {
  name        = "${var.app_name}-ecs-sg"
  description = "Security group for ECS tasks"
  vpc_id      = aws_vpc.app-vpc.id

  # inbound http 
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id] # only from alb sg
  }

  # outbound any
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-ecs-sg"
  }
}


# ##########################################################
# App Load Balancer
# ##########################################################

# Application Load Balancer
resource "aws_lb" "app_alb" {
  name               = "${var.app_name}-alb"
  load_balancer_type = "application"
  internal           = false
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  security_groups    = [aws_security_group.alb_sg.id]

  tags = {
    Name = "${var.app_name}-alb"
  }
}

# ##########################################################
# Target Group
# ##########################################################

resource "aws_lb_target_group" "target_group" {
  name        = "${var.app_name}-tg"
  vpc_id      = aws_vpc.app-vpc.id
  target_type = "ip"
  protocol    = "HTTP"
  port        = 80

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.app_name}-tg"
  }
}

# ##########################################################
# ALB Listener: integrate load balancer with target group
# ##########################################################

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

