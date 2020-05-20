data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_key_pair" "hithere" {
  key_name   = "interview2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9sBA2xTiMgNSkNj5e6Cbx38RcrY8DxVl084h31m+kxvweYAmYJHMEnlMBpEJCyQPrqkA/duiE8fDiLaJkHWDgLozCH+vLNML113o9sE8m+Pd6d4bQhuEAyapOHi60KbiaRQbUyjWz/fU9zUPqxq9w6LMpFigSj42MdM8gwP0FR6GuBKA4NJ0Q3icLx0st+5CZ1w4JMLR2nhRMuiRuOLIhI5dgzcJksJwSJUzlwc1Fbt5Nrx8P7iB8IRDxAW0j1BSuu9jc7m3i1aPiD74nhFdq2QuwtDcnyVgrNrtzKvo4MHdE5UoBRw9erdxr1QV6pXe10AYXo0qKScZbu2dbsTXP ryan@pop-os"
}

resource "aws_instance" "hithere" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"
  key_name      = aws_key_pair.hithere.key_name
}
