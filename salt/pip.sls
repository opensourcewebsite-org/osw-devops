python-pip:
  pkg.latest:
    - pkgs:
    {% if grains['oscodename'] == 'bionic' %}
      - python-pip
    {% endif %}
      - python3-pip
