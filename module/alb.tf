# application load balancer to maintain availability
resource "aws_alb" "web_app_alb" {
    name = "task alb"
    subnets = var.lb_subnets

    access_logs {
        bucket = var.access_log_bucket
        enabled = "true"
    }

    idle_timeout = var.timeout_seconds
    enable_http = true
    security_groups = var.lb_security_groups
    
    tags = {
      Name = "${var.app_name}.${var.env_name}-elb"
    }
}

# target group 
resource "aws_alb_target_group" "aws_alb_target_group" {
    name = "my-target-group"
    port = "8080"
    protocol = "HTTP"
    vpc_id = var.vpc

    lifecycle {
        create_before_destroy = true
    }
_
    health_check {
        healthy_threshold = 3
        unhealthy_threshold =10
        timeout = 5
        interval = 10
        path = "/"
        port  = "8080"
    }

    tags = merge("", {
        Name = "{var.app_name}.${var.env_name}-tg"
    })
}

#listeners

resource "aws_lb_listner" "my_listner" {
    loadbalancer_arn  = aws_alb.web_app_alb.loadbalancer_arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "redirect"

        redirect {
            port = "443"
            protocol "HTTPS"
            status_code = "HTTP_301"
        }
        tags = merge ("", {
            "role" = "my-listener"
        })

    }
}



resource "aws_lb_listner" "my_listner_https" {
    loadbalancer_arn  = aws_alb.web_app_alb.loadbalancer_arn
    port = "443"
    protocol = "HTTPS"

    default_action {
        type = "forward"
        target_group_arn = aws_alb_target_group.aws_alb_target_group.arn
        
        tags = merge ("", {
            "role" = "my-listener"
        })

    }
}

## target group attachment

resource "aws_alb_target_group_attachment" "myapp_instance_attachment" {
    target_group_arn aws_alb_target_group.aws_alb_target_group.arn
    target_id aws_instance.myapp_instance.id
}

##listner rules
resource "aws_lb_listner_rule" "forward_webserver_access" {
    listner_arn = aws_alb_listner.aws_lb_listner.arn
}

