variable "aws_region" {
  description = "Регіон AWS"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ID образу Ubuntu"
  type        = string
  default     = "ami-021bf0bba3a411792"
}

variable "instance_type" {
  description = "Тип інстансу"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Назва SSH-ключа в AWS"
  type        = string
  default     = "devops-key"
}
