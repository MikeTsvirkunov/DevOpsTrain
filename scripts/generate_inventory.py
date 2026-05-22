# generate_inventory.py
import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--master', required=True)
    parser.add_argument('--worker', required=True)
    parser.add_argument('--output', default='inventory.ini')
    args = parser.parse_args()

    inventory_content = f"""[k3s_master]
master ansible_host={args.master}

[k3s_workers]
worker ansible_host={args.worker}

[all:vars]
ansible_user=root
ansible_ssh_private_key_file=~/.ssh/argocd-node-server
"""
    with open(args.output, 'w') as f:
        f.write(inventory_content)
    print(f"Inventory saved to {args.output}")

if __name__ == "__main__":
    main()