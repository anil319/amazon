# Terraform ECS Infrastructure

This repository contains Terraform configurations to deploy an Amazon ECS (Elastic Container Service) infrastructure following best practices:

- **Modularity**: Code is organized into reusable modules
- **State Management**: Remote state configuration with locking
- **Environment Separation**: Configurations for different environments
- **Security**: Proper IAM roles and security groups
- **Networking**: Well-structured VPC and subnet configuration
- **CI/CD**: GitHub Actions workflows for automated testing and validation

## Project Structure

```
.
├── README.md
├── main.tf           # Main configuration file
├── variables.tf      # Input variables
├── outputs.tf        # Output values
├── versions.tf       # Terraform and provider versions
├── backend.tf        # State management configuration
├── .github/          # GitHub configuration
│   └── workflows/    # GitHub Actions workflows
├── modules/          # Reusable modules
│   ├── networking/   # VPC, subnets, etc.
│   ├── ecs-cluster/  # ECS cluster configuration
│   ├── ecs-service/  # ECS service and task definitions
│   └── iam/          # IAM roles and policies
└── environments/     # Environment-specific configurations
    ├── dev/
    ├── staging/
    └── prod/
```

## GitHub Repository Setup

### Initial Setup

1. Create a new GitHub repository
2. Push this code to the repository:
   ```
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/your-username/your-repo-name.git
   git push -u origin main
   ```

### GitHub Actions

This repository includes GitHub Actions workflows that automatically:
- Run Terraform validation tests
- Check Terraform formatting
- Validate Terraform configurations
- Generate Terraform plans for pull requests

To enable GitHub Actions:
1. Go to your repository on GitHub
2. Navigate to Settings > Secrets
3. Add the following secrets if needed:
   - `TF_API_TOKEN`: Your Terraform Cloud API token (if using Terraform Cloud)
   - `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`: If you want to run plans against AWS

## Usage

1. Initialize Terraform:
   ```
   terraform init
   ```

2. Plan the deployment:
   ```
   terraform plan -var-file=environments/dev/terraform.tfvars
   ```

3. Apply the configuration:
   ```
   terraform apply -var-file=environments/dev/terraform.tfvars
   ```

## State Management

This project uses an S3 backend with DynamoDB locking for state management. Before using this configuration, you need to:

1. Create an S3 bucket for state storage
2. Create a DynamoDB table for state locking
3. Update the backend configuration in `backend.tf`

## Contributing

1. Create a new branch for your feature or bugfix
2. Make your changes
3. Run the test script: `./test_terraform.sh`
4. Submit a pull request
5. GitHub Actions will automatically validate your changes
