variable "cidr" {
    description = "cidr block for VPC"
    default = "10.0.0.0/16"
}

variable "dns_hostname" {
    description = "dns hostname"
    default = true 
}

variable "public_cidr_London" {
    description = "cidr for public subnet A"
    default = "10.0.1.0/24"
}


variable "public_cidr_Paris" {
    description = "cidr for public subnet B"
    default = "10.0.2.0/24"
}

variable "public_cidr_Mumbai" {
    description = "cidr for public subnet C"
    default = "10.0.3.0/24"
}
