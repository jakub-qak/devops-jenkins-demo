resource "aws_instance" "jenkins" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  key_name      = "jenkins_key"

  # Associate the instance with the security group
  vpc_security_group_ids = ["sg-0a7ce3471af25bce5"] # Allow ssh access

  tags = {
    Name = "JenkinsServer"
  }
}

