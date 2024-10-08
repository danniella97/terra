resource "aws_security_group" "jenkins-server-sg" {
  name        = "jenkins-server-sg"
  description = "sg for ec2 instance"
  vpc_id      = data.aws_vpc.vpc_data.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "jenkins-server-sg"
    env     = "dev"
    project = "s6"
  }
}
