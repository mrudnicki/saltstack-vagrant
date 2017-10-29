/home/{{ pillar['salt-admin-user'] }}/salt_go/src:
  file.directory:
    - makedirs: True
    - user: {{ pillar['salt-admin-user'] }}
    - group: {{ pillar['salt-admin-group'] }}

/home/{{ pillar['salt-admin-user'] }}/salt_go/main:
  file.directory:
    - makedirs: True
    - user: {{ pillar['salt-admin-user'] }}
    - group: {{ pillar['salt-admin-group'] }}
