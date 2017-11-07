base:
  '*':
    - common.pkgs
  'roles:golang-service':
    - match: grain
    - golang-service
  'roles:mongodb-service':
    - match: grain
    - mongodb-service