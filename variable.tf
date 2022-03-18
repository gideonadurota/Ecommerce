variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "This is the cidr for the vpc"
}

variable "public-subnet-1-cidr" {
    default = "10.0.0.0/24"
    description = "This is the cidr for the public subnet 1"
}