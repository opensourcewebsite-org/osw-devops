acl-packge:
  pkg.installed:
    - pkgs:
      - acl

#nginx-log:
#  acl.present:
#    - name: /var/log/nginx/error.log
#    - acl_type: user
#    - acl_user: agrvsft
#    - perms: r
#
#minion-log:
#  acl.present:
#    - name: /var/log/salt/minion
#    - acl_type: user
#    - acl_user: agrvsft
#    - perms: r
