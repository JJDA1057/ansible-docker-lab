# Use Rocky Linux 8.5 as the base image
FROM rockylinux:8.5

# Update the system, install SSH server, system utilities, and Python 3.9 for Ansible
RUN dnf update -y && \
    dnf install -y openssh-server procps-ng python39 && \
    dnf clean all

# Initialize SSH host keys, create the SSH runtime directory, 
# set the root password to 'ansible', and enable root login via SSH
RUN ssh-keygen -A && \
    mkdir -p /run/sshd && \
    echo 'root:ansible' | chpasswd && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# Verify that the SSH daemon binary exists
RUN test -f /usr/sbin/sshd

# Expose the standard SSH port
EXPOSE 22

# Start the SSH daemon in the foreground
CMD ["/usr/sbin/sshd", "-D"]