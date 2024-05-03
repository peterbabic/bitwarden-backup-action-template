## Manually load organization

```bash
./export-encrypted-org.sh
```

## Decrypt

```bash
openssl aes-256-cbc -d -a -pbkdf2 -in personal.json.enc -out personal.json
openssl aes-256-cbc -d -a -pbkdf2 -in organization.json.enc -out organization.json
```

# Encrypt

```bash
openssl aes-256-cbc -a -salt -pbkdf2 -out organization.json.enc -in organization.json.orig
```
