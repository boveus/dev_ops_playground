namespace :traceroute do
  desc "traceroute"
  task :invalid_routes? => :environment do
    `FAIL_ON_ERROR=1 bundle exec rake traceroute`
  end
end
