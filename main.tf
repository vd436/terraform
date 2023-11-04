
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
      },
    ],
  })
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster"
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.my_cluster.name
}
