resource "aws_key_pair" "awsterraformkey" {
  key_name = "awsterraformkey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
