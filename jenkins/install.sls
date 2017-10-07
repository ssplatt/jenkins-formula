# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install jenkins
{%- from "jenkins/map.jinja" import jenkins with context %}

{% if jenkins.repos_managed %}
jenkins_repo:
  pkgrepo.managed:
    - humanname: Jenkins
    - name: deb http://pkg.jenkins-ci.org/debian binary/
    - key_url: http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key
    
jessie_backports_repo:
  pkgrepo.managed:
    - humanname: Jessie Backports
    - name: deb http://http.debian.net/debian jessie-backports main
{% endif %}

jenkins_required_pkgs:
  pkg.installed:
    - pkgs: {{ jenkins.required_pkgs }}
