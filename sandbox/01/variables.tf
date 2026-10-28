variable "managed_mode" {
    description = "If true, turns a subset of resources to managed ( in a subscription with better authority )"
    type = bool
    default = false
}

variable "resource_group_name" {
    type = string
    default = "rg"
}

variable "location" {
    type = string
    default = "malaysiawest"
}
