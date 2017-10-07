# jenkins-formula

Installs and configures Jenkins.

## Usage
### defaults
the base defaults will install a sparse jenkins server running on port 8080. openjdk-8 is installed from the jessie-backports repo. jenkins is installed from the jenkins repo.

```
jenkins:
  enabled: False
  repos_managed: true
  required_pkgs:
    - jenkins
    - openjdk-8-jre-headless
  service:
    name: jenkins
    state: dead
    enable: False
```

### using an external repo management salt formula
the jenkins and jessie-backports repos are managed by the local formula by default. Use the toggle to turn that off when using with an external repo management formula.

```
jenkins:
  enabled: True
  repos_managed: False
```

### preseeding plugins and packages
You can install additional packages by adding them to the required_plugins list. You can use the plugins: variable to ensure plugins are installed.

```
jenkins:
  enabled: True
  required_pkgs:
    - git
  plugins:
    - name: slave-setup.hpi
      source: http://updates.jenkins-ci.org/latest/slave-setup.hpi
      source_hash: sha1=529b98017648e0a18991c4d7d34a317e39b4f20d
    - name: saltstack.hpi
      source: http://updates.jenkins-ci.org/latest/saltstack.hpi
      source_hash: sha1=ba3584054b1fd819777710a8cbaf03b31b7c3d6c
    - name: github.hpi
      source: http://updates.jenkins-ci.org/latest/github.hpi
      source_hash: sha1=8472f780bb60b97fe80658863d046a5e181eb144
    - name: github-api.hpi
      source: http://updates.jenkins-ci.org/latest/github-api.hpi
      source_hash: sha1=563661f54324cdf796c63eb9d12cbd4e9fab7a19
    - name: git.hpi
      source: http://updates.jenkins-ci.org/latest/git.hpi
      source_hash: sha1=5f6fcb3b43f25aef661c78585f2e9796f18b0a4a
    - name: git-client.hpi
      source: http://updates.jenkins-ci.org/latest/git-client.hpi
      source_hash: sha1=aea765523f4bf602adf3ee24fc8cf4124869f2e7
    - name: plain-credentials.hpi
      source: http://updates.jenkins-ci.org/latest/plain-credentials.hpi
      source_hash: sha1=f459e09981859df206a4d9ee40d8bc3707c528ae
    - name: warnings.hpi
      source: http://updates.jenkins-ci.org/latest/warnings.hpi
      source_hash: sha1=761ed0ace15938e2ac51aa71562d8f3b293932c4
    - name: ansicolor.hpi
      source: http://updates.jenkins-ci.org/latest/ansicolor.hpi
      source_hash: sha1=76fae28c2dbd3e7bdda0ad765ebfddee9585fe77
    - name: config-file-provider.hpi
      source: http://updates.jenkins-ci.org/latest/config-file-provider.hpi
      source_hash: sha1=55cba40c231745f386d4930e1c7589e23b41cb30
    - name: token-macro.hpi
      source: http://updates.jenkins-ci.org/latest/token-macro.hpi
      source_hash: sha1=b5c30afb999e8f553ec151c8106f5cfa1d5b9a56
```

### preseeding jobs
You can pre-populate jenkins with jobs by defining them in the jobs: variable. Modifications will probably need to be made to the config.xml.j2 to apply this template to other job types.

```
jenkins:
  enabled: True
  jobs:
    - name: TempJob
      description: "This is a Test Job, please delete or otherwise edit me."
      giturl: git@github.com:example/test.git
      buildcommand: "echo &quot;this is a test&quot;"
```
