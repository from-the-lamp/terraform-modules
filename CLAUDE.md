# CLAUDE.md

## Commands come from the Taskfile, not from memory or docs

Run `task --list-all` before doing anything. This repo also ships a `mise.toml` pinning the CLI
tools (`opentofu`, `oras`, `tfsec`, `terraform-docs`, `task`) the Taskfile expects - run `mise trust`
once per clone, then `mise install`, instead of assuming tools are on PATH or installing them
another way. Note: the pinned tool is `opentofu` (binary `tofu`), not `terraform` -
`.tasks/build.yml` runs `tofu get`, not `terraform get`.

## VERSION is the release trigger (same convention as docker-images)

Each module directory has its own `VERSION` file. `task build:push:changed` only rebuilds/pushes a
module whose `VERSION` differs from `DIFF_BASE` (in CI the MR's merge base, or the previous `main`
commit for a push to `main`; locally `HEAD~1` against the working tree) - and skips the push entirely
if that exact version tag already exists in the OCI registry. `task plan` prints the diff base and
the `<OCI_REPO>/<dir>:<VERSION>` each changed module would be pushed to; `DIFF_BASE=<ref>` and
`TARGETS="dir1 dir2"` (environment variables) override the selection, and `TARGETS` in "Run
pipeline" on `main` publishes those modules without a commit. Bump `VERSION` to a new value to force a real release. If you change a module's `.tf`
files without bumping `VERSION`, nothing gets published. As of this writing, no module directory in
the repo has a `VERSION` file yet - add one yourself before this mechanism does anything for a given
module (`task list:all`/`task build:push:changed` will otherwise just report nothing to do).

`task dev:build:push:<dirname>` (dev mode) pushes to the same tag unconditionally, overwriting
whatever is there - use it for iterating, not against a version you consider a real release.

To force a specific module to build regardless of git diff: `task build:push:<dirname>`.

## CI: build stage, then push stage - and only `main` pushes

`.gitlab-ci.yml` only includes the shared `task-pipeline` component from `infra/cicd` (its README
has the jobs, inputs and contract). The `build` job runs `task auth` + `task build:changed` in every
pipeline (`<dir>/.output/module.zip`, kept as artifacts); the `push` job runs `task auth` +
`task push:changed` on `main` only (`oras push` of those zips as OpenTofu
module packages - the zip is the single `archive/zip` layer OpenTofu requires inside the OCI
artifact). Change what a stage does in this Taskfile; change the pipeline skeleton in `infra/cicd`.

`OCI_REPO` is `registry.gitlab.com/from-the-lamp/infra/terraform-modules`. The project's canonical
path is `from-the-lamp/infra/terraform-modules` (that is `$CI_REGISTRY_IMAGE`); the
`infra/terraform/modules` path in git remotes and `darwin/workspaces.nix` is only a redirect, and
registry paths do not follow redirects - never derive `OCI_REPO` from the clone URL. Task's global
`vars:` outrank environment variables, so the value in `Taskfile.yml` is what every push uses, in
CI too. Nothing
consumes these OCI artifacts yet: terragrunt (`root.hcl`, `private_modules_base_url`) still pulls
modules over `git::https`.
