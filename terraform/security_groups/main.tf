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

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_security_group"
  description = "Security group for allowing HTTP and Jenkins access"

  # Allow inbound HTTP (port 80) from any IP
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allows traffic from any IP
  }

  # Allow inbound Jenkins (port 8080) from any IP
  ingress {
    description = "Allow Jenkins traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allows traffic from any IP
  }

  # Outbound rules to allow all traffic (required for default outbound connectivity)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_security_group"
  }
}

resource "aws_security_group" "prometheus_sg" {
  name        = "prometheus_security_group"
  description = "Security group for allowing HTTP access to Prometheus"

  # Allow inbound Prometheus HTTP access (port 9090) from any IP
  ingress {
    description = "Allow Prometheus HTTP traffic"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allows traffic from any IP
  }

  # Outbound rules to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prometheus_security_group"
  }
}

resource "aws_security_group" "grafana_sg" {
  name        = "grafana_security_group"
  description = "Security group for allowing HTTP access to Grafana"

  # Allow inbound Grafana HTTP access (port 3000) from any IP
  ingress {
    description = "Allow Grafana HTTP traffic"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # allows traffic from any IP
  }

  # Outbound rules to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "grafana_security_group"
  }
}
