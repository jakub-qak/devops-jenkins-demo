resource "aws_instance" "jenkins" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  key_name      = "jenkins_key"

  # Associate the instance with the security group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "JenkinsServer"
  }
}

# Create Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # All IPs allowed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # All IPs allowed
  }

  tags = {
    Name = "allow_ssh"
  }
}
