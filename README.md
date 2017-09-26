# README
This is a project to test various things with Travis CI.  I have done the following things:

gem install travis
# travis CI tools
travis login
# log in to travis using github creds
cd <prj directory>
travis setup heroku
# configure API key in the travis YML for my current app
  
I added the following lines to my Travis YML to facilitate CI:

script:
- bundle exec rspec
# run tests
- bundle exec brakeman --exit-on-warn --quiet -f plain
# run brakeman to do static analysis of security vulnerabilities
- bundle exec rubycritic --minimum-score 95 --mode-ci --no-browser
# run rubycritic and error out if the build scores below 95
# only run it against the latest commit
# don't launch a browser
before_script:
- bundle exec rake db:create
# create the DB before running scripts
- RAILS_ENV=test bundle exec rake db:migrate --trace
# run the migration to set up DB schema
- bundle exec rake db:test:prepare
# prepare test db
