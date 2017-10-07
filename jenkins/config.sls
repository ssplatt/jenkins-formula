# -*- coding: utf-8 -*-
# vim: ft=sls
# How to configure jenkins
{%- from "jenkins/map.jinja" import jenkins with context %}
jenkins_jobs_dir:
  file.directory:
    - name: /var/lib/jenkins/jobs
    - user: jenkins
    - group: jenkins
    - mode: 0755
    
jenkins_plugins_dir:
  file.directory:
    - name: /var/lib/jenkins/plugins
    - user: jenkins
    - group: jenkins
    - mode: 0755

jenkins_default_config:
  file.managed:
    - name: /etc/default/jenkins
    - source: salt://jenkins/files/default-jenkins.j2
    - user: root
    - group : root
    - mode: 0644
    - template: jinja

{% if jenkins.plugins is defined %}
# copy plugins to /var/lib/jenkins/plugins
  {% for plugin in jenkins.plugins %}
jenkins_{{ plugin.name }}_plugin:
  file.managed:
    - name: /var/lib/jenkins/plugins/{{ plugin.name }}
    - source: {{ plugin.source }}
    - source_hash: {{ plugin.source_hash }}
    - user: jenkins
    - group: jenkins
    - mode: 0644
    - onchanges:
      - pkg: jenkins_required_pkgs
  {% endfor %}
{% endif %}

{% if jenkins.jobs is defined %}
# create standard jobs
  {% for job in jenkins.jobs %}
jenkins_{{ job.name }}_dir:
  file.directory:
    - name: /var/lib/jenkins/jobs/{{ job.name }}
    - user: jenkins
    - group: jenkins
    - mode: 0755
    - onchanges:
      - pkg: jenkins_required_pkgs
jenkins_{{ job.name }}_job:
  file.managed:
    - name: /var/lib/jenkins/jobs/{{ job.name }}/config.xml
    - source: salt://jenkins/files/config.xml.j2
    - template: jinja
    - user: jenkins
    - group: jenkins
    - mode: 0644
    - job: {{ job }}
    - onchanges:
      - pkg: jenkins_required_pkgs
  {% endfor %}
{% endif %}
