# Champs Élysées

> [!Note]
> Considered [GOAD](https://github.com/Orange-Cyberdefense/GOAD) for an out-of-the-box experience.

![image](https://upload.wikimedia.org/wikipedia/commons/1/11/Schwabe_Carlos_Elysian_Fields.jpg)

## Table of content

- [Requirements](https://github.com/MikeHorn-git/Champs-Elysees#requirements)
- [Plugins](https://github.com/MikeHorn-git/Champs-Elysee#plugins)
- [Installation](https://github.com/MikeHorn-git/Champs-Elysees#installation)
- [Makefile](https://github.com/MikeHorn-git/Champs-Elysees#makefile)
- [Playbooks](https://github.com/MikeHorn-git/Champs-Elysees#paybooks)
- [Framework](https://github.com/MikeHorn-git/Champs-Elysees#framework)

## Requirements

- Ansible
- Vagrant
- VirtualBox

## Plugins

- Ansible
  - ansible.windows
  - community.windows
- Vagrant
  - vagrant-vbguest
  - winrm
  - winrm-elevated
  - winrm-fs

## Installation

```bash
git clone https://github.com/MikeHorn-git/Champs-Elysees.git
cd Champs-Elysees/
make setup
```

## Makefile

```bash
Usage: make <target>
Targets:
  help          Display this help message
  setup         Deploy Vagrant and run badblood playbook
  deploy        Install requirements
  red           Deploy red theme playbooks
  blue          Deploy blue theme playbooks
  scans         Deploy scans playbooks
  all           Deploy all playbooks
  clean         Destroy Vagrant VM
```

## Playbooks

### Red Team Playbooks

- `vuln_adcs_template_control`
- `vuln_kerberos_properties_preauth_priv`
- `vuln_permissions_gpo_priv`

### Blue Team Playbooks

- `patch_kerberos_properties_preauth_priv`
- `patch_permissions_gpo_priv`

### Scanning Playbooks

- `adrecon`
- `pingcastle`

### Provisioning

- `badblood`
- `inventory`

## Framework

- **Create Your PowerShell Script**

  - Write your PowerShell script and save it in the appropriate `scripts/` directory.

- **Create an Ansible Playbook**

  - Write an Ansible playbook that:
  - Waits for the script to be available on the target machine.
  - Executes the PowerShell script using `win_shell` or `win_command`.

- **Add the Script to Your Repository**

  - Place the PowerShell script in the correct path (e.g., `scripts/red/`).

- **Run the Playbook**

  - Use the Makefile to deploy the script (e.g., `red`):

    ```bash
    make red
    ```
