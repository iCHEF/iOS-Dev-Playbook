install_ansible() {
    if ! hash ansible-galaxy 2>/dev/null; then
        echo "Install Ansible"
        sudo easy_install pip
        sudo pip install ansible
    fi
}

install_ansible
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i inventory -K
