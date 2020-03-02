#generic sysctl tuning

# Disable ipv6
net.ipv6.conf.all.disable_ipv6:
  sysctl.present:
    - value: 1

net.ipv6.conf.default.disable_ipv6:
  sysctl.present:
    - value: 1

net.ipv6.conf.lo.disable_ipv6:
  sysctl.present:
    - value: 1

# allow kernel to swap only in out-of-memory conditions
vm.swappiness:
  sysctl.present:
    - value: 0

