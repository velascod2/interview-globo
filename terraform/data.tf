data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}
data "aws_subnet_ids" "public_selected" {
  vpc_id = "vpc-d3bb11ae"
  //vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "tag:tier"
    values = ["public"]
  }
}
