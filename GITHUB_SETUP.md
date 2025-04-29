# GitHub Repository Setup Guide

This guide provides detailed instructions for setting up this Terraform ECS infrastructure project in a GitHub repository.

## Prerequisites

- [Git](https://git-scm.com/downloads) installed on your local machine
- A [GitHub](https://github.com/) account
- Basic familiarity with Git and GitHub

## Step 1: Create a GitHub Repository

1. Log in to your GitHub account
2. Click on the "+" icon in the top-right corner and select "New repository"
3. Enter a repository name (e.g., "terraform-ecs-infrastructure")
4. Add a description (optional)
5. Choose "Private" or "Public" visibility as appropriate
6. Do NOT initialize the repository with a README, .gitignore, or license
7. Click "Create repository"

## Step 2: Initialize Your Local Repository

You can use the provided `init_github_repo.sh` script to initialize your local repository:

```bash
# Make the script executable
chmod +x init_github_repo.sh

# Run the script
./init_github_repo.sh
```

The script will:
1. Configure Git with your username and email
2. Initialize a Git repository
3. Add all files to the repository
4. Create an initial commit
5. Set up the remote origin pointing to your GitHub repository

## Step 3: Push Your Code to GitHub

After running the initialization script, push your code to GitHub:

```bash
git push -u origin main
```

## Step 4: Set Up GitHub Actions

The repository includes a GitHub Actions workflow in `.github/workflows/terraform.yml` that automatically validates your Terraform code.

To enable GitHub Actions:

1. Go to your repository on GitHub
2. Navigate to "Settings" > "Secrets and variables" > "Actions"
3. Add the following secrets if needed:
   - `TF_API_TOKEN`: Your Terraform Cloud API token (if using Terraform Cloud)
   - `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`: If you want to run plans against AWS

## Step 5: Configure Branch Protection Rules

To protect your main branch:

1. Go to your repository on GitHub
2. Navigate to "Settings" > "Branches"
3. Click "Add rule" under "Branch protection rules"
4. In "Branch name pattern", enter `main`
5. Enable the following options:
   - "Require a pull request before merging"
   - "Require approvals" (set to 1 or more)
   - "Require status checks to pass before merging"
   - "Require branches to be up to date before merging"
   - "Include administrators" (optional, but recommended)
6. Click "Create" or "Save changes"

## Step 6: Set Up Code Owners

The repository includes a CODEOWNERS file in `.github/CODEOWNERS`. Update this file with the appropriate usernames:

```
# These owners will be the default owners for everything in the repo
* @your-username

# Terraform module owners
/modules/networking/ @your-networking-expert
/modules/ecs-cluster/ @your-ecs-expert
/modules/ecs-service/ @your-ecs-expert
/modules/iam/ @your-security-expert

# Environment configuration owners
/environments/prod/ @your-production-admin
```

## Step 7: Configure Repository Settings

Additional recommended repository settings:

1. **Merge Button**: In "Settings" > "General" > "Pull Requests", consider:
   - Disabling "Allow merge commits"
   - Enabling "Allow squash merging"
   - Enabling "Always suggest updating pull request branches"

2. **Automatically Delete Head Branches**: In "Settings" > "General" > "Pull Requests", enable "Automatically delete head branches"

3. **Deploy Keys**: If you need to give a server access to this repository, use deploy keys instead of personal access tokens.

## Step 8: Set Up Issue Templates

The repository includes issue templates in `.github/ISSUE_TEMPLATE/`. These templates will automatically appear when users create new issues.

## Step 9: Set Up Pull Request Template

The repository includes a pull request template in `.github/PULL_REQUEST_TEMPLATE.md`. This template will automatically appear when users create new pull requests.

## Step 10: Terraform Backend Configuration

Once your repository is set up, you'll need to configure the Terraform backend:

1. Create an S3 bucket for state storage
2. Create a DynamoDB table for state locking
3. Update the backend configuration in `backend.tf`

## Troubleshooting

- **Push Rejected**: If your push is rejected, try `git pull --rebase origin main` before pushing again
- **GitHub Actions Failures**: Check the workflow logs for detailed error messages
- **Branch Protection Issues**: Ensure you have admin access to the repository to configure branch protection rules