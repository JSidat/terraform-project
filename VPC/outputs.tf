output "vpc_1" {
    value = aws_vpc.AprilDevOpsVPC.id
}

output "subnet_London_id" {
    value = aws_subnet.AprilDevOpsPubnetLondon.id
}


output "subnet_Paris_id" {
    value = aws_subnet.AprilDevOpsPubnetParis.id
}


output "subnet_Mumbai_id" {
    value = aws_subnet.AprilDevOpsPubnetMumbai.id
}