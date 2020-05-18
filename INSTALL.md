# Installation

Please read through our [Contributing Guidelines](CONTRIBUTING.md).

## General setup for Ubuntu 18.04 LTS
- For download install.sh script, run command 'wget -L https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/install.sh'
- Run install.sh script as root
- Wait for few minutes and check created file '/srv/pillar/users-password.txt'
- Put your password's hash in '/srv/pillar/users-password.txt'
- Run 'salt '*' state.apply'
