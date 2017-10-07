# -*- coding: utf-8 -*-
# vim: ft=yaml
# Custom Pillar Data for jenkins

jenkins:
  enabled: True
  required_pkgs:
    - jenkins
    - openjdk-8-jre-headless
    - git
  service:
    name: jenkins
    state: running
    enable: true
  plugins:
    - name: warnings.hpi
      source: http://updates.jenkins-ci.org/latest/warnings.hpi
      source_hash: sha1=5a30e20dfe54419af510b5db8e13130d7066c5aa
    - name: ansicolor.hpi
      source: http://updates.jenkins-ci.org/latest/ansicolor.hpi
      source_hash: sha1=76fae28c2dbd3e7bdda0ad765ebfddee9585fe77
  jobs:
    - name: TempJob
      description: "This is a Test Job, please delete or otherwise edit me."
      giturl: git@bgithub.com:example/test.git
      buildcommand: "echo &quot;this is a test&quot;"
