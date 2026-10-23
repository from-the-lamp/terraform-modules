# CLAUDE.md

## Commands come from the Taskfile, not from memory or docs

Run `task --list-all` before doing anything. This repo also ships a `mise.toml` pinning the CLI
tools (`opentofu`, `oras`, `tfsec`, `terraform-docs`, `task`) the Taskfile expects - run `mise trust`
once per clone, then `mise install`, instead of assuming tools are on PATH or installing them
another way. Note: the pinned tool is `opentofu` (binary `tofu`), not `terraform` -
`.tasks/build.yml` runs `tofu get`, not `terraform get`.

## VERSION is the release trigger (same convention as docker-images)

Each module directory has its own `VERSION` file. `task build:push:changed` only rebuilds/pushes a
module whose `VERSION` file is in the last commit's diff (`git diff --name-only HEAD~1 | grep
'VERSION$'`) - and skips the push entirely if that exact version tag already exists in the OCI
registry. Bump `VERSION` to a new value to force a real release. If you change a module's `.tf`
files without bumping `VERSION`, nothing gets published. As of this writing, no module directory in
the repo has a `VERSION` file yet - add one yourself before this mechanism does anything for a given
module (`task list:all`/`task build:push:changed` will otherwise just report nothing to do).

`task dev:build:push:<dirname>` (dev mode) pushes to the same tag unconditionally, overwriting
whatever is there - use it for iterating, not against a version you consider a real release.

To force a specific module to build regardless of git diff: `task build:push:<dirname>`.
