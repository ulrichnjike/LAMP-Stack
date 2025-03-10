
resource "aws_lightsail_instance" "server1" {
  name = "lamp-server"
  blueprint_id = "centos_stream_9"
  bundle_id = "medium_1_0"
  availability_zone = "us-east-1a"
  key_pair_name = "lamp_stack"
  user_data = file("script.sh")
}
