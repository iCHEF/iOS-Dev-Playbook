install_ansible() {
    if ! hash ansible-galaxy 2>/dev/null; then
        echo "Install Ansible"
        curl https://bootstrap.pypa.io/get-pip.py | sudo python
        sudo pip install ansible
    fi
}

install_ansible

rm -rf mac_setup
mkdir mac_setup

curl -L http://github.com/iCHEF/iOS-Dev-Playbook/zipball/master/ > mac_setup/master.zip
cd mac_setup
unzip -a master.zip

TARGET_FOLDER=pwd
for file in ./*; do
  if [[ $file =~ "iOS-Dev-Playbook" ]]; then
    TARGET_FOLDER=$file
  fi
done

cd $TARGET_FOLDER
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i inventory -K


cd ../..
rm -rf mac_setup
