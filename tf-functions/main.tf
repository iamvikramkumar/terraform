terraform { }

locals {
  value = "Hello World!"
}

variable "string_list" {
  type = list(string)
  default = [ "serv1", "serv2", "server3", "serv1" ]
  
}

output "output" {
    #value = upper(local.value)
    # value = startswith(local.value, "Hello")
    # value = split( " ", local.value)
    # value = min(1,2,3,4,5,6,7,8,9,10)
    # value = abs(-15.123)
    # value = length(var.string_list)
    # value = join(":", var.string_list)
    # value = contains(var.string_list, "serv1")
    # value = var.string_list  
    value = toset(var.string_list)  // it remove duplicates
}