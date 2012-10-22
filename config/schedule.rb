job_type :rake, "cd :path && PATH=/usr/local/bin:/usr/bin:/bin bundle exec rake :task --silent :output"

every 30.minutes do
  rake 'commit_bot:work'
end
