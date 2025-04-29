#!/bin/bash
# Make this script executable with: chmod +x test_terraform.sh

# Test script to validate Terraform configuration

# Set error handling
set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting Terraform validation tests...${NC}"

# Test 1: Check Terraform formatting
echo -e "\n${YELLOW}Test 1: Checking Terraform formatting...${NC}"
if terraform fmt -check -recursive; then
  echo -e "${GREEN}✓ Terraform formatting is correct${NC}"
else
  echo -e "${RED}✗ Terraform formatting issues found${NC}"
  terraform fmt -recursive
  echo -e "${GREEN}✓ Terraform formatting issues fixed${NC}"
fi

# Test 2: Validate Terraform configuration
echo -e "\n${YELLOW}Test 2: Validating Terraform configuration...${NC}"
if terraform validate; then
  echo -e "${GREEN}✓ Terraform configuration is valid${NC}"
else
  echo -e "${RED}✗ Terraform configuration is invalid${NC}"
  exit 1
fi

# Test 3: Check for environment-specific configurations
echo -e "\n${YELLOW}Test 3: Checking environment-specific configurations...${NC}"
for env in dev staging prod; do
  if [ -f "environments/$env/terraform.tfvars" ]; then
    echo -e "${GREEN}✓ Found configuration for $env environment${NC}"
  else
    echo -e "${RED}✗ Missing configuration for $env environment${NC}"
    exit 1
  fi
done

# Test 4: Check for required modules
echo -e "\n${YELLOW}Test 4: Checking required modules...${NC}"
required_modules=("networking" "ecs-cluster" "ecs-service" "iam")
for module in "${required_modules[@]}"; do
  if [ -d "modules/$module" ]; then
    echo -e "${GREEN}✓ Found module: $module${NC}"
  else
    echo -e "${RED}✗ Missing module: $module${NC}"
    exit 1
  fi
done

echo -e "\n${GREEN}All tests passed! Terraform configuration is valid.${NC}"