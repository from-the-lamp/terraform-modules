# 🏗️ From the Lamp: Terraform Modules

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge)](https://opensource.org/licenses/Apache-2.0)
[![GitLab CI](https://img.shields.io/badge/gitlab%20ci-%23181717.svg?style=for-the-badge&logo=gitlab&logoColor=white)](https://gitlab.com/from-the-lamp/infra/terraform/modules/-/pipelines)

A collection of reusable Terraform modules for managing infrastructure across various cloud providers and services. These modules are designed with a focus on security, scalability, and adherence to industry best practices.

## Design principles

- **Reusability:** modules are composable building blocks
- **Standardization:** consistent interfaces (inputs/outputs) and documentation
- **Security:** avoid embedding secrets; prefer least-privilege patterns
- **Automation-first:** intended to be driven by IaC workflows (Terragrunt/CI)

---

## 📂 Repository Structure

All module directories live under `modules/`, organized into logical groups based on the
provider or purpose:

- **`modules/cloudflare/`** — Cloudflare resources (Tunnels, DNS, WAF).
- **`modules/kubernetes/`** — Management of manifests and resources within K8s.
- **`modules/oracle/`** — Infrastructure in Oracle Cloud Infrastructure (OCI).
- **`modules/vault/`** — Configuration of policies, secrets, and authentication in HashiCorp Vault.
- **`modules/tools/`** — Helper utilities (password generation, cloud-init).

---

## 🛠️ Available Modules

### ☁️ Cloudflare
| Module | Description |
|:---|:---|
| [`tunnel`](./modules/cloudflare/tunnel) | Configure Cloudflare Tunnels for secure access to local services. |

### 🏛️ Oracle Cloud (OCI)
A comprehensive set of modules for building robust cloud infrastructure:
- **Networking:** [`vcn`](./modules/oracle/vcn), [`nsg`](./modules/oracle/nsg), [`nlb`](./modules/oracle/nlb).
- **Compute:** [`instance`](./modules/oracle/instance), [`instance_pool`](./modules/oracle/instance_pool).
- **Security:** [`kms_vault`](./modules/oracle/kms_vault), [`identity_user`](./modules/oracle/identity_user).
- **Storage:** [`bucket`](./modules/oracle/bucket).

### 🔒 HashiCorp Vault
Modules for automating secrets management:
- [`oidc`](./modules/vault/oidc) — Configure OIDC authentication.
- [`database_engine`](./modules/vault/database_engine) — Dynamic secrets for databases.
- [`kubernetes_auth_roles`](./modules/vault/kubernetes_auth_roles) — Roles for K8s pod authorization.
- [`policies`](./modules/vault/policies) — ACL policy management.

---

## 🧰 Development

Tool versions (`opentofu`, `oras`, `tfsec`, `terraform-docs`, `task`) are
pinned in `mise.toml`, used both locally and by the `Build:Tools` CI job -
install [mise](https://mise.jdx.dev), then:

```
mise install
task
```

Each module directory needs a `VERSION` file to be built/published - see
`task --list-all` for the `build:*`/`push:*` tasks.

## 🚀 Quick Start

Example of using the Cloudflare Tunnel module:

```hcl
module "cloudflare_tunnel" {
  source = "git::https://gitlab.com/from-the-lamp/infra/terraform/modules.git//modules/cloudflare/tunnel?ref=main"

  account_id   = var.cloudflare_account_id
  tunnel_name  = "my-app-tunnel"
  secret       = var.tunnel_secret
}
```

---

## 🤝 Contributing

We welcome Pull Requests! Before submitting changes, please ensure:
1. You have run `terraform fmt` to format your code.
2. Your changes are documented in the corresponding module subdirectory.
3. Input variables and outputs have clear descriptions.

---

<p align="center">
  Made with ❤️ by the <b>From the Lamp</b> team
</p>
