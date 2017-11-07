mongodb:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/mongodb.conf