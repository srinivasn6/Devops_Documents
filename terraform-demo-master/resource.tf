resource "aws_instance" "webserver" {
    ami             = "ami-04b9e92b5572fa0d1"
    instance_type   = "t2.micro"

    vpc_security_group_ids  = [aws_security_group.webserver-sg.id]

    user_data       = <<-EOF
                    #!/bin/bash
                    echo "Hello, Rise 'n' Shine" > index.html
                    nohup busybox httpd -f -p ${var.serverport} &
                    EOF

    tags            = {
        Name        = "webserver"
  }
}

resource "aws_security_group" "webserver-sg" {
  		name = "ec2-webserver-sg"
  		ingress {
    		from_port   = var.serverport
    		to_port     = var.serverport
    		protocol    = "tcp"
    		cidr_blocks = ["0.0.0.0/0"]
  		}
}