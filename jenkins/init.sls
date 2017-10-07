# -*- coding: utf-8 -*-
# vim: ft=sls
# Init jenkins
{%- from "jenkins/map.jinja" import jenkins with context %}

{% if jenkins.enabled %}
include:
  - jenkins.install
  - jenkins.config
  - jenkins.service
{%- else %}
'jenkins-formula disabled':
  test.succeed_without_changes
{% endif %}
