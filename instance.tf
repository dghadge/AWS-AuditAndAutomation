resource "aws_instance" "tf-instance" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.awsterraformkey.key_name}"

}

  resource "aws_ebs_volume" "ebs-volume" {
      availability_zone = "${aws_subnet.main-public-1.availability_zone}"
      size = 20
      type = "gp2" 
      tags {
          Name = "extra volume data"
      }
  }
  
  resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name = "/dev/xvdh"
    volume_id = "${aws_ebs_volume.ebs-volume.id}"
    instance_id = "${aws_instance.tf-instance.id}"
  }
