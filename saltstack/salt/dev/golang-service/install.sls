/home/{{ pillar['salt-admin-user'] }}/bin/golib:
  file.directory:
    - user: "{{ pillar['salt-admin-user'] }}"
    - group: {{ pillar['salt-admin-group'] }}
    - makedirs: True
download-go:
  cmd.run:
    - name: curl -O  https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
    - runas: "{{ pillar['salt-admin-user'] }}"
    - creates: /home/{{ pillar['salt-admin-user'] }}/bin/golib/go/bin
unpack-go:
  cmd.run:
    - name: tar -C /home/{{ pillar['salt-admin-user'] }}/bin/golib -xzf go1.9.1.linux-amd64.tar.gz
    - runas: "{{ pillar['salt-admin-user'] }}"
    - creates: /home/{{ pillar['salt-admin-user'] }}/bin/golib/go/bin
/home/{{ pillar['salt-admin-user'] }}/bin/go:
  file.symlink:
      - target: /home/{{ pillar['salt-admin-user'] }}/bin/golib/go/bin/go
      - user: {{ pillar['salt-admin-user'] }}
      - group: {{ pillar['salt-admin-group'] }}
      - makedirs: True