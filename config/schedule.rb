job_type :rake, "cd :path && PATH=/usr/local/bin:/usr/bin:/bin bundle exec rake :task --silent :output"

every 30.minutes do
  rake 'commit_bot:work'
end

every 5.minutes do
  command 'curl -sI showcase.koideploy.com > /dev/null'
end
