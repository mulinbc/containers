# SSHD

SSHD service in docker container

```bash
docker run -d -p 22:22 -e AUTHORIZED_KEYS='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFyMeBrD6kvXTdC77van0LQo1f2QgYX8hf0yB0EhJ8Y0' -e ROOT_PASSWORD='passwd' mulinbc/sshd
```
