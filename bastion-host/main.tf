
resource "aws_instance" "jenkins-server" {
  ami                    = "ami-01c1c1c9c0165ad21" # Ubuntu 20.04 LTS
  instance_type          = "t2.small"
  key_name               = "jenkins-keypair"  # Set your key pair name
  subnet_id              = data.aws_subnet.jenkins_server_pubic_subnet.id
  vpc_security_group_ids = [data.aws_security_group.instance_sg_data.id]

  # Adding storage
  root_block_device {
    volume_size = 20    # Size of the root volume in gigabytes
    volume_type = "gp2" # Type of volume (e.g., gp2, standard, io1)
  }
  tags = {
    Name = "bastion-host"
  }
}

