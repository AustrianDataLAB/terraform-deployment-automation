variable "instance_name" {
  type = string
  default = "from ondemand and coder"
}

variable "ssh" {
  type = string
  default = "acer win"
}

variable "local_network_id" {
  type = string
  default = "03b21c24-910f-4ec5-a8f3-419db219b383"
}


variable "token" {
  type = string
}

variable "flavor" {
    type = string
    default = "standard.tiny"
}
