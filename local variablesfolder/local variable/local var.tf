locals {
 ami  = "ami-0d26eb3972b7f8c96"
 type = "t2.micro"
 tags = {
   Name = "My Virtual Machine"
   Env  = "Dev"
 }
 subnet = "subnet-0f49876639145ee00"
 nic    = aws_network_in
 tags          = local.tags
 
 n
 etwork_interface {
   network_interface_id = aws_network_interface.my_nic.id
   device_index         = 0
 }
}
 
resource "aws_network_interface" "my_nic" {}
 description = "My NIC"
 subnet_id   = var.subnet
 
 tag = {
   Name = "My NIC"
 }
