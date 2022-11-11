### HOT TO INSTALL VAULT

- First, install the HashiCorp tap, a repository of all our Homebrew packages.

```bash
brew tap hashicorp/tap
```

- Now, install Vault with hashicorp/tap/vault.

```bash
brew install hashicorp/tap/vault
```

- To update to the latest, run

```bash
brew upgrade hashicorp/tap/vault
```

- vault 서버 접속

```
vault server -dev -dev-root-token-id="education"
```

참고자료 : [HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/secrets-vault?in=terraform/certification-associate-tutorials)
