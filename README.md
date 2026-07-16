```markdown
# Ansible Docker Lab

A clean and modular lab environment to learn and practice infrastructure automation using Ansible and Docker containers.

## Features
- Modular structure with Ansible Roles.
- SSH-based configuration automation.
- Rocky Linux 8.5 containers.
- Orchestration for clusters (Head and Worker nodes).
```

## Quick Start

1. Start the containers:
```bash
docker compose up -d
```

2. Check if the containers are running:
```bash
docker ps -a
```

3. Run the ansible playbooks:
```bash
ansible-playbook -i inventory.ini site.yml
```

4. Get into the head node:
```bash
docker exec -it head bash
```

5. Try to use ip commands:
```bash
ip -c a
```

6. Try to connect with node1 using ssh:
```bash
ssh root@node1
```

## Enjoy
You can also practice by yourself by changing some configurations.

If you change any configuration you must rebuild the docker containers by running the commands below:

```bash
docker compose down 
docker compose build --no-cache
docker compose up -d
ansible-playbook -i inventory.ini site.yml
```

This project uses GitHub Actions to automate Continuous Integration (CI) tests, ensuring that the repository and its automation workflows remain functional after every change.
