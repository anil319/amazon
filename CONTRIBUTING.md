# Contributing to Terraform ECS Infrastructure

Thank you for your interest in contributing to this project! Here are some guidelines to help you get started.

## Development Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests (`./test_terraform.sh`)
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Pull Request Process

1. Update the README.md or documentation with details of changes if appropriate
2. Fill out the pull request template completely
3. Ensure all tests pass
4. Get approval from at least one maintainer

## Terraform Style Guide

1. Use consistent formatting (run `terraform fmt` before committing)
2. Use descriptive variable and resource names
3. Group related resources together
4. Comment complex or non-obvious code
5. Use modules for reusable components

## Testing

Before submitting a pull request, run the test script:

```bash
./test_terraform.sh
```

This script checks:
- Terraform formatting
- Terraform validation
- Environment-specific configurations
- Required modules

## Environment-Specific Changes

When making changes that affect specific environments:

1. Test in the dev environment first
2. Document any migration steps needed
3. Get explicit approval for production changes

## Security Considerations

1. Never commit secrets or credentials
2. Use variables for sensitive values
3. Follow the principle of least privilege for IAM roles
4. Review security group rules carefully

## Questions?

If you have any questions or need help, please open an issue or contact the maintainers.