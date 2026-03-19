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

The repository is organized into logical groups based on the provider or purpose:

- **`cloudflare/`** — Cloudflare resources (Tunnels, DNS, WAF).
- **`kubernetes/`** — Management of manifests and resources within K8s.
- **`oracle/`** — Infrastructure in Oracle Cloud Infrastructure (OCI).
- **`vault/`** — Configuration of policies, secrets, and authentication in HashiCorp Vault.
- **`tools/`** — Helper utilities (password generation, cloud-init).

---

## 🛠️ Available Modules

### ☁️ Cloudflare
| Module | Description |
|:---|:---|
| [`tunnel`](./cloudflare/tunnel) | Configure Cloudflare Tunnels for secure access to local services. |

### 🏛️ Oracle Cloud (OCI)
A comprehensive set of modules for building robust cloud infrastructure:
- **Networking:** [`vcn`](./oracle/vcn), [`nsg`](./oracle/nsg), [`nlb`](./oracle/nlb).
- **Compute:** [`instance`](./oracle/instance), [`instance_pool`](./oracle/instance_pool).
- **Security:** [`kms_vault`](./oracle/kms_vault), [`identity_user`](./oracle/identity_user).
- **Storage:** [`bucket`](./oracle/bucket).

### 🔒 HashiCorp Vault
Modules for automating secrets management:
- [`oidc`](./vault/oidc) — Configure OIDC authentication.
- [`database_engine`](./vault/database_engine) — Dynamic secrets for databases.
- [`kubernetes_auth_roles`](./vault/kubernetes_auth_roles) — Roles for K8s pod authorization.
- [`policies`](./vault/policies) — ACL policy management.

---

## 🚀 Quick Start

Example of using the Cloudflare Tunnel module:

```hcl
module "cloudflare_tunnel" {
  source = "git::https://gitlab.com/from-the-lamp/infra/terraform/modules.git//cloudflare/tunnel?ref=main"

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
