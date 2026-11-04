# Contributing guidelines

## Goals

These modules are intended to be reusable building blocks for standardized infrastructure delivery.

## Quality checks

Before opening an MR:

```bash
terraform fmt -recursive
terraform validate
```

## Versioning

Each module directory has its own `VERSION` file. CI (`task build:push:changed`) only
builds/publishes a module whose `VERSION` changed since the diff base, and `helm push`/`oras push`
style publish is skip-if-exists: pushing the same `VERSION` twice does not overwrite the tag. **Any
real content change to a module (not just docs/comments) needs its `VERSION` bumped in the same
change** - otherwise CI silently treats the push as "nothing to do" for that module and the edit
never reaches the registry, even though the source changed.

Exception: `task dev:build:push:<dir>` (fast local iteration) overwrites the current tag in place
without touching `VERSION` - that's its whole point, not a bug. Don't use it as a substitute for a
real version bump before merging.

## Documentation

- Each module should include a generated `README.md` (terraform-docs).
- All inputs/outputs must have clear descriptions.

## Security

- Do not commit secrets.
- Prefer variables for sensitive values.
