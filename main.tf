resource "aws_instance" "assess1" {
    ami = data.aws_ami.this_ami.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.assess1_sg.id]
    key_name = "assess1"
}


resource "aws_security_group" "assess1_sg" {
  name        = "assess1_sg"
  description = "assess1 SG"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "assess1" {
  key_name   = "assess1"
  public_key = tls_private_key.rsa.public_key_openssh
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "assess1" {
    content  =  tls_private_key.rsa.private_key_pem
    filename = "assess1"
}