variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "project_name" {
  type    = string
  default = "globo-interview"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "monitoring" {
  type    = bool
  default = false
}

variable "ingress_with_cidr_blocks" {
  type    = list
  default = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "allow ssh"
    cidr_blocks = "172.31.0.0/20"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "allow http"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "allow https"
    cidr_blocks = "0.0.0.0/0"
  }
  ]
}
variable "egress_with_cidr_blocks" {
  type    = list
  default = [
    {
      rule = "all-all"
    }
    ]
}