install-mongo:
  pkg.installed:
    - pkgs:
      - mongodb-server
      - mongodb-clients
/etc/mongodb.conf:
  file.managed:
    - source: salt://mongodb-service/conf/mongodb.conf
    - template: jinja
    - user: vagrant # TODO: change before production
    - group: vagrant
    - makedirs: True