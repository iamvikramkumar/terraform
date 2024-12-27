terraform {}

# Number List

variable "num_list" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}

#Objet list of person
variable "person_list" {
 type = list(object({
   fname = string
   lname = string
 })) 
    default = [
    {
        fname = "Ram"
        lname = "Kumar"
    },
    {
        fname = "Sham"
        lname = "Kumar"
    }
    ]
}


variable "map_list" {
  type = map(number)
    default = {
        one = 1
        two = 2
        three = 3
    }
  
}

# Calculations

locals {
    sum = 1 + 2
    product = 2 * 3
    division = 4 / 2
    modulus = 5 % 2
    equal = 2!=3

    
#double the list
double = [for num in var.num_list : num *2]

#odd number only
odd = [for num in var.num_list : num if num % 2 != 0]

 # To get only fname from peron list
 fname_list = [for person in var.person_list : person.fname]

 # map list
 map_list = [for key, value in var.map_list : value * 2]

 double_map = {for key, value in var.map_list : key => value * 2}

}

output "output" {
    value = local.double_map
    }
  

# output "output" {
#     value = {
#         sum = local.sum
#         product = local.product
#         division = local.division
#         modulus = local.modulus
#         equal = local.equal
#     }
# }


 output "num_list" {
    value = var.num_list
 }