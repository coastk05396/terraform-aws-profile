resource "aws_security_group" "vprofile-bean-elb-sg" {
  vpc_id      = module.vpc.vpc_id
  name        = "vprofile-bean-elb-sg"
  description = "Security Group for bean-elb"


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
#ssh from public to bastion host
resource "aws_security_group" "vprofile-bastion-sg" {
  vpc_id      = module.vpc.vpc_id
  name        = "vprofile-bastion-sg"
  description = "Security Group for bastion ec2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
#ssh from bastion to ec2
resource "aws_security_group" "vprofile-prod-sg" {
  vpc_id      = module.vpc.vpc_id
  name        = "vprofile-prod-sg"
  description = "Security Group for beanstalk ec2 instance"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.vprofile-bastion-sg.id]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

#ec2 to backend 
resource "aws_security_group" "vprofile-backend-sg" {
  vpc_id      = module.vpc.vpc_id
  name        = "vprofile-backend-sg"
  description = "Security Group for RDS, active mq, elastic cache"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.vprofile-prod-sg.id]

  }

  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.vprofile-bastion-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_security_group_rule" "sec_group_allow_itslef" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.vprofile-backend-sg.id
  source_security_group_id = aws_security_group.vprofile-backend-sg.id

}
