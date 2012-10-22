# Use this file to easily define all of your cron jobs.

every 30.minutes do
  rake 'commit_bot:work'
end
