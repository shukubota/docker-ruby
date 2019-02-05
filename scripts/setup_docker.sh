#!/bin/bash

bundle install --path=vendor/bundle
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
