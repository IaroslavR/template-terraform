output "instance_ip" {
  description = "EC2 instance IP"
  value       = module.ec2.public_ip
}

output "this_key_pair_key_name" {
  description = "The key pair name."
  value       = module.key_pair.this_key_pair_key_name
}
