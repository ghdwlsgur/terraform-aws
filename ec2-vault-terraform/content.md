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

- 현재 사용중인 쉘 확인

```bash
echo $SHELL
```

- 환경변수 추가
  `export VAULT_ADDR='http://127.0.0.1:8200`

- 설정파일 새로고침

```bash
source ~/.zshrc
```

- http://127.0.0.1:8200 접속 token : education

참고자료 : [HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/secrets-vault?in=terraform/certification-associate-tutorials)
