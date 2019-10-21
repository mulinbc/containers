#!/bin/bash
set -e

if [ ! -z "${AUTHORIZED_KEYS}" ] && [ "${AUTHORIZED_KEYS}" != "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFyMeBrD6kvXTdC77van0LQo1f2QgYX8hf0yB0EhJ8Y0" ]; then
    echo ${AUTHORIZED_KEYS} > ~/.ssh/authorized_keys
fi

if [ ! -z "${ROOT_PASSWORD}" ] && [ "${ROOT_PASSWORD}" != "admin" ]; then
    echo "root:${ROOT_PASSWORD}" | chpasswd
fi

/usr/sbin/sshd -D
