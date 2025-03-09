# Generates a secure private key and encodes it as PEM 
resource "tls_private_key" "lightsail_key" {
  algorithm = "RSA"
  rsa_bits  = 2048   
} 
# Create the key Pair
resource "aws_lightsail_key_pair" "lightsail_key2" {
  name ="lamp_stack"
  public_key = tls_private_key.lightsail_key.public_key_openssh   
}
# Save file
resource "local_file" "ssh_key" {
  filename      = "lamp_stack.pem"
  content       = tls_private_key.lightsail_key.private_key_pem  
}

resource "aws_lightsail_instance" "server1" {
  name = "lamp-server"
  blueprint_id = "centos_stream_9"
  bundle_id = "medium_1_0"
  availability_zone = "us-east-1a"
  key_pair_name = "lamp_stack"
}
