# Contributing guidelines

## Goals

These modules are intended to be reusable building blocks for standardized infrastructure delivery.

## Quality checks

Before opening an MR:

```bash
terraform fmt -recursive
terraform validate
```

## Documentation

- Each module should include a generated `README.md` (terraform-docs).
- All inputs/outputs must have clear descriptions.

## Security

- Do not commit secrets.
- Prefer variables for sensitive values.
