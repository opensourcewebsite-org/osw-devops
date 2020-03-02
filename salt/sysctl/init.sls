# generic state applies common tunables to all servers
# ip_forward overrides net.ipv4.ip_forward
# link_speed customizes tcp related tunables
# srv_type adds various overrides based on the server type
# - common type does not apply anything
# - router adds router-specific tunables

include:
  - .generic
