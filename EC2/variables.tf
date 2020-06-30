variable "ami" {
    description = "instance image"
    default = "ami-089cc16f7f08c4457"
}

variable "type" {
    description = "instance size"
    default = "t2.micro"
}

variable "key_name" {
    description = "key par to SSH into instance"
    default = "new_key"
}

variable "public_subnet_id" {
    default = "default value"
}

variable "vpc_security_group_ids" {
    default = "default value"
}

variable "vpc_id" {
    default = "default value"
}





London = ami-00f6a0c18edb19300
Paris = ami-0e11cbb34015ff725
Mumbai = ami-02d55cb47e83a99a0