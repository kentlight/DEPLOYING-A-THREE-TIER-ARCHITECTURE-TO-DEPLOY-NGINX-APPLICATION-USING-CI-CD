variable "lb_sg" {}
variable "public_subnets" {}
variable "app_asg" {}
variable "tg_port" {}
variable "tg_protocol" {}
variable "vpc_id" {}
variable "listener_port" {}
variable "listener_protocol" {}
variable "azs" {}
variable "auto_scale_backend" {}
variable "auto_scale_frontend" {}

variable "lb_backend_sg" {}
variable "tg_port_backend" {}
variable "tg_protocol_backend" {}
variable "listener_port_backend" {}
variable "listener_protocol_backend" {}