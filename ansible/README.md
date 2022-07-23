# Ansible

Notes on setup and learing [here](https://www.youtube.com/watch?v=w9eCU4bGgjQ)

1. `brew install ansible`
1. `ansible --version`
1. Add hosts file
    * name the group of hosts whatever you want
1. `ansible -i ./inventory/hosts k3s -m ping --user ryan`
    * ```json
        10.10.50.244 | SUCCESS => {
        "ansible_facts": {
            "discovered_interpreter_python": "/usr/bin/python3"
        },
        "changed": false,
        "ping": "pong"
        }
1. `ansible-playbook ./playbooks/apt.yml --user ryan --ask-become-pass -i ./inventory/hosts`
1. Make sure all ryan users have the same password
1. 