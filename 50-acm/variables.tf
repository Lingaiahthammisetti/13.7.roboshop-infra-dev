variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}


variable "zone_name" {
    default = "lingaiah.online"
}

variable "zone_id" {
    default = "Z07608533HHBQHW47XU3F"
}
