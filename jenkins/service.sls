# -*- coding: utf-8 -*-
# vim: ft=sls
# Manage service for service jenkins
{%- from "jenkins/map.jinja" import jenkins with context %}

jenkins_service:
 service.{{ jenkins.service.state }}:
   - name: {{ jenkins.service.name }}
   - enable: {{ jenkins.service.enable }}
   - watch:
       - file: jenkins_default_config
{%- if jenkins.plugins is defined %}
  {%- for plugin in jenkins.plugins %}
       - file: jenkins_{{ plugin.name }}_plugin
  {%- endfor %}
{%- endif %}
{%- if jenkins.jobs is defined %}
  {%- for job in jenkins.jobs %}
       - file: jenkins_{{ job.name }}_job
  {%- endfor %}
{%- endif %}
