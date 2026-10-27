locals {
  pre = var.env_name == "" ? "": "${var.env_name}-"
}
