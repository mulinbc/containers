FROM fedora:30

ENV ROOT_PASSWORD='admin' AUTHORIZED_KEYS='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFyMeBrD6kvXTdC77van0LQo1f2QgYX8hf0yB0EhJ8Y0'

RUN dnf update -y && \
    dnf install -y bash-completion corkscrew git iproute iputils openssh-clients openssh-server procps telnet util-linux-user vim wget zsh && \
    # generate ssh host key
    ssh-keygen -A && \
    # set ssh authorized key
    mkdir -p ~/.ssh && \
    echo ${AUTHORIZED_KEYS} > ~/.ssh/authorized_keys && \
    # modify ssh config
    sed -i 's/session\s*required\s*pam_loginuid.so/session    optional     pam_loginuid.so/' /etc/pam.d/sshd && \
    sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/' /etc/ssh/sshd_config && \
    # set root password
    echo "root:${ROOT_PASSWORD}" | chpasswd && \
    # clean
    dnf clean all && rm -rf /var/cache/dnf/*

COPY sshd-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "sshd-entrypoint.sh" ]

CMD [ "/usr/sbin/sshd", "-D" ]
