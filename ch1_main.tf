provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
    ]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ubuntu_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.nano"
}


