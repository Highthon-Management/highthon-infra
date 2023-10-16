variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "container_port" {
  type = number
  default = 80
}

variable "host_port" {
  type = number
  default = 80
}

variable "az_count" {
  type    = number
  default = 2
}

variable "scaling_max_capacity" {
  type = number
  default = 3
}

variable "scaling_min_capacity" {
  type = number
  default = 1
}

variable "cpu_or_memory_limit" {
  type = number
  default = 70
}

variable "tpl_path" {
  type = string
  default = "service.config.json.tpl"
}

variable "env_suffix" {
  type = string
  default = "dev"
}

variable "domain" {
  default = "kanghyuk.co.kr"
}

variable "app_name" {
  default = "highthon"
}
