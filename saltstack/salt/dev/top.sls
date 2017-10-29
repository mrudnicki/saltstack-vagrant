base:
  '*':
    - common.pkgs
  'roles:golang-service':
    - match: grain
    - golang-service