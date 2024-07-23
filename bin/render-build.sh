#!/usr/bin/env bash
# exit on error
set -o errexit

bundle update net-pop
bundle install
bundle exec rake db:migrate