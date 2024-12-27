variable "aws_instance_type" {
    description = "what type of instance you want to create?"
   // default = "t2.micro"
    type = string

    validation {
        condition = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro"
        error_message = "You must provide only t2 and t3 micro instance only, other types not allowed."
    }
}



# We comnine both varibles into a single object
# variable "root_volume_size" {
#   type = number
#   default = 20
# }

# variable "root_volume_type" {
#     type = string
#     default = "gp2"
# }


// Combine same category variables into a single object
variable "ec2_config" {
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 20
    v_type = "gp2"
  }
}


variable "additional_tags" {
    type = map(string)  # expecting key and value format
    default = {}
  
}