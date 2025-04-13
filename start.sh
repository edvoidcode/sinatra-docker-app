#!/bin/bash
mkdir -p db
bundle install
ruby app.rb -o 0.0.0.0 -p 80
