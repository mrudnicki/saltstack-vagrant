/home/{{ pillar['salt-admin-user'] }}/mnt/salt_go/src:
  file.directory:
    - makedirs: True
    - user: {{ pillar['salt-admin-user'] }}
    - group: {{ pillar['salt-admin-group'] }}

/home/{{ pillar['salt-admin-user'] }}/mnt/salt_go/main:
  file.directory:
    - makedirs: True
    - user: {{ pillar['salt-admin-user'] }}
    - group: {{ pillar['salt-admin-group'] }}ss

GOPATH:
  file.append:
    - name: /home/{{ pillar['salt-admin-user'] }}/.profile
    - text: export GOPATH=/home/{{ pillar['salt-admin-user'] }}/mnt/salt_go