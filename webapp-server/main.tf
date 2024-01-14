module "app-server" {
    source = "../module/"
    ami_image = var.image-name
    az-zone = var.zone
    instance_type = var.instance_type
    dd_monitoring = "Y"
    security_groups = [
         var.sg1,
         var.sg2
        ]         ## we can create security groups and assign here
    
    key_name = "my_ssh_key"
    subnet = var.subnet_id
    env_type = var.env_type
    vpc = var.vpc_id
    lb_security_groups = [var.lb-sg1,var.lb_sg2] ## we can create LB SGs and assing their IDs here.

    ssm_params = {
        tomcat_url = "https://${domain_name}"
        tomcat-user = var.tomcat_user
        tomcat_password = var.tomcat_password
    }

}
