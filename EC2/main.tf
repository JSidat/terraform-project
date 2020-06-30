resource "aws_instance" "AprilDevopsEC2" {
    ami = var.ami
    instance_type = var.type
    key_name = var.key_name
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [var.vpc_security_group_ids]
    associate_public_ip_address = true

    tags = {
        Name = "AprilDevopsEC2"
}

}


data "aws_launch_configuration" "London_EC2" {
  name = "test-launch-config"
  image_id = var.Londonami
  instance_type = var.type
  key_name = var.key_name
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  associate_public_ip_address = true

  tags = {
      Name = "London EC2"

  }
}

data "aws_launch_configuration" "Paris_EC2" {
  name = "test-launch-config"
  image_id = var.Parisami
  instance_type = var.type
  key_name = var.key_name
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  associate_public_ip_address = true

  tags = {
      Name = "London EC2"

  }
}

data "aws_launch_configuration" "Mumbai_EC2" {
  name = "test-launch-config"
  image_id = var.Mumbaiami
  instance_type = var.type
  key_name = var.key_name
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  associate_public_ip_address = true

  tags = {
      Name = "London EC2"

  }
}

resource "aws_autoscaling_group" "LondonAutoScaling" {
  provider = "London"
  name                      = "London-auto-scaling"
  max_size                  = 3
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
}

resource "aws_autoscaling_schedule" "LondonSchedule" {
  scheduled_action_name  = "auto-scale-London"
  min_size               = 0
  max_size               = 3
  desired_capacity       = 3
  start_time             = "T09:00:00Z"
  end_time               = "T17:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.LondonAutoScaling.name    
}

resource "aws_autoscaling_group" "ParisAutoScaling" {
  provider = "Paris"
  name                      = "Paris-auto-scaling"
  max_size                  = 3
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
}

resource "aws_autoscaling_schedule" "ParisSchedule" {
  scheduled_action_name  = "auto-scale-Paris"
  min_size               = 0
  max_size               = 3
  desired_capacity       = 3
  start_time             = "T08:00:00Z"
  end_time               = "T13:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.ParisAutoScaling.name    
}


resource "aws_autoscaling_group" "MumbaiAutoScaling" {
  provider = "Mumbai"
  name                      = "Mumbai-auto-scaling"
  max_size                  = 3
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  termination_policies      = ["OldestInstance"]
}

resource "aws_autoscaling_schedule" "MumbaiSchedule" {
  scheduled_action_name  = "auto-scale-Mumbai"
  min_size               = 0
  max_size               = 3
  desired_capacity       = 3
  start_time             = "T21:00:00Z"
  end_time               = "T17:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.MumbaiAutoScaling.name    
}
