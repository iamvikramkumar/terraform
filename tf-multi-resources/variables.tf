# Variable
variable "region" {
    description = "value of region"
    type = string
    default = "us-east-1"
  
}


variable "ec2_config" {
      type = list(object({
        ami = string
        instance_type = string
      }))
}