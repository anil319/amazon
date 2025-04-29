#!/bin/bash
# Script to initialize a GitHub repository with this code

# Set error handling
set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== GitHub Repository Initialization Script ===${NC}"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed. Please install git first.${NC}"
    exit 1
fi

# Prompt for GitHub repository information
read -p "Enter your GitHub username: " github_username
read -p "Enter your GitHub repository name: " repo_name
read -p "Enter your GitHub email: " github_email

# Configure git
echo -e "\n${YELLOW}Configuring git...${NC}"
git config user.name "$github_username"
git config user.email "$github_email"

# Initialize git repository
echo -e "\n${YELLOW}Initializing git repository...${NC}"
git init
git add .
git commit -m "Initial commit"
git branch -M main

# Add GitHub remote
echo -e "\n${YELLOW}Adding GitHub remote...${NC}"
git remote add origin "https://github.com/$github_username/$repo_name.git"

# Instructions for pushing to GitHub
echo -e "\n${GREEN}Repository initialized successfully!${NC}"
echo -e "\n${YELLOW}Next steps:${NC}"
echo -e "1. Create a repository named '$repo_name' on GitHub if you haven't already"
echo -e "2. Push your code to GitHub with: ${GREEN}git push -u origin main${NC}"
echo -e "3. Set up GitHub repository secrets for GitHub Actions if needed"
echo -e "   - Go to your repository on GitHub"
echo -e "   - Navigate to Settings > Secrets and variables > Actions"
echo -e "   - Add the following secrets if needed:"
echo -e "     - TF_API_TOKEN: Your Terraform Cloud API token (if using Terraform Cloud)"
echo -e "     - AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY: If you want to run plans against AWS"
echo -e "\n${YELLOW}Branch protection recommendations:${NC}"
echo -e "1. Go to your repository on GitHub"
echo -e "2. Navigate to Settings > Branches"
echo -e "3. Add a branch protection rule for 'main'"
echo -e "4. Enable the following options:"
echo -e "   - Require pull request reviews before merging"
echo -e "   - Require status checks to pass before merging"
echo -e "   - Require branches to be up to date before merging"
echo -e "   - Include administrators"
echo -e "\n${BLUE}Happy coding!${NC}"