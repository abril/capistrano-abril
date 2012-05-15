# capistrano-abril Changelog

## 0.2.6

* setting vars when run task 'deploy:migrate'.
* fix alexandria sites deploy, to create structure dir correctly.
* new task to update structure code on deploy. Useful for dev and qa environments.

## 0.2.5

Bug:

* Changed way to find current environment before run bundler task. Useful for non-rails applications.

## 0.2.1

Bug:

* symlinks: calling setup_vars to ensure path's.
* setup: cleaning up releases based on old time mask.

## 0.2.0

New:

* abril: show_vars, setup_vars
* abril: apachectl start/stop/restart
* abril: after symlink: deploy:cleanup
* abril: apachectl start/stop/restart
* alx-structure
* memcached
* redis
* check_rails2
* check_rails3

Bug:

* branch: using 'master' as default

Correction:

* bundler: oneline command
* sudo: pty => true

Removed:

* migrations
* site-reference
* site-structure

## 0.1.1

New:

* bundler: production without development and test
* config_files: can use '*.yml'_
* multisage: able to create 'stage.rb'
* symlinks: can symlink from anywhere

## 0.1.0

* CHANGELOG was just created. Please see git commit history for more information.

