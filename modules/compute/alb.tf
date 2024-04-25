resource "aws_lb" "cloudbees-alb" {
  name               = "cloudbees-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

resource "aws_lb_listener" "cloudbees_lb_listener" {
  load_balancer_arn = aws_lb.cloudbees-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cloudbees_tg.arn
  }
}

resource "aws_lb_target_group" "cloudbees_tg" {
  name     = "cloudbeestg"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cloudbees_vpc.id
}