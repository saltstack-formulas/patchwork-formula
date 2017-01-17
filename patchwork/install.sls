{% from "patchwork/map.jinja" import patchwork with context %}

install patchwork from targz:
  archive.extracted:
    - name: /opt/patchwork
    - source: https://github.com/getpatchwork/patchwork/archive/{{ patchwork.version }}.tar.gz

patchwork dependencies:
  pkg.installed:
    - pkgs:
      - python3
      - python3-virtualenv
      - python3-pip

patchwork virtualenv:
  virtualenv.managed:
    - name: /opt/patchwork/venv
    - requirements: /opt/patchwork/{{ patchwork.version }}/requirements-prod.txt
    - use_wheel: true
    - python: python3
    - require:
      - pkg: patchwork dependencies
      - archive: install patchwork from targz

# vim: ft=sls