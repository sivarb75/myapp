
resource "aws_instance" "myapp_server" {
    ami = var.ami_image
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    subnet_id = var.subnet_id
    associate_public_ip_address  = false ## using private IP for this instance 
    key_name = var.key_name

    tags = {
        var.my_tags,{
            Name = "myapp-instance"
            {
                Name = "myapp.instance"
                monitoring = "dd-monitor" # datadog monitoring
            }
        }
    }

    root_block_devide {
        volume_size = 50 
        volume_type = var.root_volume_type
        tags = merge (
           Name = "myinstance-name"
           "role" = "storage"
        )
    }

}
