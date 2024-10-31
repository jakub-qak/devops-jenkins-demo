resource "aws_instance" "jenkins" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"

  tags = {
    Name = "JenkinsServer"
  }
}
