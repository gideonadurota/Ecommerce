variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "This is the cidr for the vpc"
    type = string
}

variable "public-subnet-1-cidr" {
    default = "10.0.0.0/24"
    description = "This is the cidr for the public subnet 1"
    type = string
}

variable "public-subnet-2-cidr" {
    default = "10.0.1.0/24"
    description = "This is the cidr for the public subnet 2"
    type = string
}

variable "private-subnet-1-cidr" {
    default = "10.0.2.0/24"
    description = "This is the cidr for the private subnet 1"
    type = string
}

variable "private-subnet-2-cidr" {
    default = "10.0.3.0/24"
    description = "This is the cidr for the private subnet 2"
    type = string
}

variable "private-subnet-3-cidr" {
    default = "10.0.4.0/24"
    description = "This is the cidr for the private subnet 3"
    type = string
}

variable "private-subnet-4-cidr" {
    default = "10.0.5.0/24"
    description = "This is the cidr for the private subnet 4"
    type = string
}