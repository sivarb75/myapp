variable "env_type" {
    description  = "environment name : dev/test/prod"
    type = strin
    default = "dev"
}

variable "role" {
    type = string
}

variable "keyname" {
    type = string
    default = "mykey"
}

variable "subnet" {
    type = string
}

variable "availability_zone" {
    type =  string
}
variable = "vpc" {
    type = string
}

variable "ami" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "security_groups" {
    type = set(string)
}
variable "key_name" {
    type = string
}
variable "root_volume_type" {
    type = string
    default = "gp3"
}
variable "lb_subnets" {
    type = set(string)
}
variable "lb_security_groups" {
    type = set(string)
}
variable "lb_timeout_seconds" {
    type = number
    default = 400
}
variable "monitoring" {
    type =  string
    default = "N"
    description = "enable monitoring on instance"
}
