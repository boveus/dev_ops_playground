# README
This is a project to test a few things related to devops in general.  I am currently working on a few things related to Travis CI and how I can use it to automate static code analysis of rails apps. 

My next goal is to deploy a rails app through Capistrano to a Digital Ocean droplet.

I plan to continually expand this and add more tools as time goes on.  If you are reading this and you are a devops pro or someone interested in devops and want to contribute, please feel free to drop a PR with questions, additions, or requests.  Thanks.

These are my current additions:

# Install and set up travis gem
```
gem install travis
#install travis CLI tools
travis login
#set up travis to use github login
cd <prj directory>
travis setup heroku
#set up heroku/travis for current project
```
  
I added the following lines to my Travis YML to facilitate CI:

```ruby
script:
- bundle exec rspec
#run tests
- bundle exec brakeman --exit-on-warn --quiet -f plain
#run brakeman to do static analysis of security vulnerabilities
- bundle exec rubycritic --minimum-score 95 --mode-ci --no-browser
#run rubycritic and error out if the build scores below 95
#only run it against the latest commit
#don't launch a browser
before_script:
- bundle exec rake db:create
#create the DB before running scripts
- RAILS_ENV=test bundle exec rake db:migrate --trace
#run the migration to set up DB schema
- bundle exec rake db:test:prepare
#prepare test db
```

I tested the following gems and couldn't get them to work with Travis.  This test is currently living on its own branch.
```
gem install traceroute
```
