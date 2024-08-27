#data "aws_vpc" "vpc_data" {
#  tags = {
#    name = "jenkins-server-vpc"
#  }
#}
#
#output "aws_vpc" {
#  value = data.aws_vpc.vpc_data.id
#}