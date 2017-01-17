{% from "patchwork/map.jinja" import patchwork with context %}

{{ patchwork.user }}:
  group.present:
    - name: {{ patchwork.group }}
  user.present:
    - shell: /bin/bash
    - home: /opt/patchwork
    - groups:
      - {{ patchwork.group }}

# vim: ft=sls
