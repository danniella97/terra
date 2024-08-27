# data "aws_security_group" "instance_sg_data" {
#   tags = {
#     Name = "jenkins-server-sg" # name of your security groupe
#   }
# }
# output "security_group_id" {
#   value = data.aws_security_group.instance_sg_data.id
# }


data "aws_vpc" "vpc_data" {
  tags = {
    name = "jenkins-server-vpc"
  }
}
output "aws_vpc" {
  value = data.aws_vpc.vpc_data.id
}