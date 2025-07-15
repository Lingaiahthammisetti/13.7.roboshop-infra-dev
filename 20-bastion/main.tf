module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  ami = data.aws_ami.joindevops.id
  name = local.resource_name

  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id              = local.public_subnet_id
  user_data = file("bastion.sh")
  root_block_device = [{
    encrypted  = false           # Not encrypted
    type       = "gp3"           # gp3 volume type
    size       = 100              # 100 GiB
    iops       = 3000            # 3000 IOPS
    throughput = 125             # Optional: default for gp3 is 125 MiB/s
  }]
  tags = merge(
    var.common_tags,
    var.bastion_tags,
    {
        Name = local.resource_name
    }
  )
}