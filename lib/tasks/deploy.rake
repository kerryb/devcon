desc "run local tests, deploy, then run e2e tests"
task :deploy => [:default, :"deploy:check_committed", :"cucumber:e2e"]

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
