resource "aws_instance" "jenkins" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.small"
  key_name      = "jenkins_key"

  # Associate the instance with the security group
  vpc_security_group_ids = [
    "sg-0a7ce3471af25bce5", # SSH access
    "sg-01ced279f184dc5db", # Jenkins HTTP access 
    "sg-059f8130259a4ba89"  # Prometheus HTTP access
  ]

  tags = {
    Name = "JenkinsServer"
  }
}

