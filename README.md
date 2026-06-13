# Terraform AWS Infrastructure

Production-style AWS infrastructure provisioned with Terraform, following the AWS Well-Architected Framework. Deploys a complete, isolated network environment with an EC2 instance, IAM role, and security controls.

## Infrastructure overview
## What this provisions

- **VPC** with DNS support enabled
- **Public subnet** with internet gateway and route table
- **Security group** — HTTP (80) and SSH (22) ingress, all egress
- **IAM role + instance profile** — attached to EC2, follows least-privilege principle
- **EC2 instance** — parameterised AMI, instance type, and environment via variables

## Key Terraform practices demonstrated

- **Modular variables** — region, environment, instance type, and AMI all in `variables.tf`; no hardcoded values in `main.tf`
- **Outputs** — VPC ID, subnet ID, security group ID, EC2 instance ID and public IP, IAM role ARN
- **Consistent tagging** — every resource tagged with `Name` and `Environment`
- **State safety** — `.gitignore` excludes `terraform.tfstate` and `.tfvars` files

## Usage

    # Initialise Terraform
    terraform init

    # Preview changes
    terraform plan

    # Apply infrastructure
    terraform apply

    # Destroy when done
    terraform destroy

## Variables

| Variable | Description | Default |
|---|---|---|
| aws_region | AWS region | ap-south-1 |
| project_name | Prefix for all resource names | terraform-demo |
| environment | Environment tag (dev/staging/prod) | dev |
| instance_type | EC2 instance type | t3.micro |
| ami_id | Amazon Linux 2 AMI | ap-south-1 AMI |

## Project structure

    main.tf          VPC, subnet, IGW, route table, security group, IAM role, EC2
    variables.tf     Input variables with descriptions and defaults
    outputs.tf       Output values for all created resource IDs
    .gitignore       Excludes state files and secrets from version control
