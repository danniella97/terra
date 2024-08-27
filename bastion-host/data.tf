data "aws_security_group" "instance_sg_data" {
  tags = {
    Name = "jenkins-server-sg" # name of your security groupe
  }
}
output "security_group_id" {
  value = data.aws_security_group.instance_sg_data.id
}


data "aws_subnet" "jenkins_server_pubic_subnet" {
  tags = {
    Name = "jenkins-server-vpc-public-us-east-2a" # name of your pubic_subnet
  }
}
output "aws_public_subnet" {
  value = data.aws_subnet.jenkins_server_pubic_subnet.id
}

#ssh -i jenkins-keypair.pem ubuntu@10.20.101.154   cd ..