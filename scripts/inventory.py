#!/usr/bin/env python3
import json
import subprocess

def get_ips():
    result = subprocess.run(["tofu", "output", "-json"], capture_output=True, text=True)
    outputs = json.loads(result.stdout)
    return {
        "master": outputs["main_server_ip"]["value"],
        "worker": outputs["argocd_node_ip"]["value"]
    }

def main():
    ips = get_ips()
    inventory = {
        "all": {
            "hosts": {
                "main-server": {"ansible_host": ips["master"], "ansible_user": "root"},
                "argocd-node": {"ansible_host": ips["worker"], "ansible_user": "root"}
            },
            "vars": {
                "ansible_ssh_private_key_file": "~/.ssh/id_rsa"  # путь к вашему ключу
            }
        },
        "k3s_master": {"hosts": {"main-server": None}},
        "k3s_worker": {"hosts": {"argocd-node": None}}
    }
    print(json.dumps(inventory, indent=2))


if __name__ == "__main__":
    main()