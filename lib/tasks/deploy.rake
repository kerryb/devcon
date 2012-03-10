desc "run local tests, deploy, then run smoke tests against heroku server"
task :deploy => [:default, :"deploy:check_committed", :"deploy:heroku", :"cucumber:heroku"]

namespace :deploy do
  desc "ensure everything is committed"
  task :check_committed do
    fail "Uncommitted changes" unless %x{git status} =~ /working directory clean/
  end

  desc "deploy to heroku"
  task :heroku do
    system("git push heroku") || fail("Failed to deploy")
  end
end
