provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_first_server" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t3.micro"

  tags = {
   Name = "MySecondTerraformServer"
  }
}