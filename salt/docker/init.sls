docker_pkgs:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - software-properties-common
      - curl

{% set lsb_release = salt['grains.get']('oscodename', 'none') %}

docker-pkg:
  pkgrepo.managed:
    - humanname: Docker CE Repository
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ lsb_release }} stable
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg
  pkg.installed:
    - fromrepo: {{ lsb_release }}
    - name: docker-ce
    - refresh: True

python-pip:
  pkg.installed

docker-compose:
  pip.installed:
    - require:
      - pkg: python-pip

docker-py:
  pip.installed:
    - require:
      - pkg: python-pip
