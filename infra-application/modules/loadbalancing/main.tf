

# INTERNET FACING LOAD BALANCER

resource "aws_lb" "three_tier_lb" {
  name            = "three-tier-loadbalancer"
  security_groups = [var.lb_sg]
  subnets         = var.public_subnets
  idle_timeout    = 400

  depends_on = [
    var.app_asg,
    var.auto_scale_backend,
    var.auto_scale_frontend
  ]
}

resource "aws_lb_target_group" "three_tier_tg" {
  name     = "three-tier-lb-tg-${substr(uuid(), 0, 3)}"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "three_tier_lb_listener" {
  load_balancer_arn = aws_lb.three_tier_lb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.three_tier_tg.arn
  }
}


resource "aws_lb" "three_tier_backend_lb" {
  name            = "three-tier-backend-loadbalancer"
  internal           = true
  load_balancer_type = "application"
  security_groups = [var.lb_backend_sg]
  subnets         = var.public_subnets
  idle_timeout    = 400

  depends_on = [
    var.app_asg,
    var.auto_scale_backend,
    var.auto_scale_frontend
  ]
}

resource "aws_lb_target_group" "three_tier_backend_tg" {
  name     = "three-tier-backend-lb-tg-${substr(uuid(), 0, 3)}"
  port     = var.tg_port_backend
  protocol = var.tg_protocol_backend
  vpc_id   = var.vpc_id

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "three_tier_backend_lb_listener" {
  load_balancer_arn = aws_lb.three_tier_backend_lb.arn
  port              = var.listener_port_backend
  protocol          = var.listener_protocol_backend
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.three_tier_backend_tg.arn
  }
}
