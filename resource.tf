resource "aws_instance" "terraformubuntu" {
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  key_name = "CLPM"
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  
  
  tags = {
    Name = "t-Ubuntu"
  }

  user_data = file("script.sh")

}

resource "aws_security_group" "sg" {
  name        = "Security group using terraform"
  description = "Security group using terraform"
  vpc_id      = "vpc-05225a1d53fdbcd90"

  ingress {
    description = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description = "Otbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = {
    Name = "security group using terrafrom"
  }
}