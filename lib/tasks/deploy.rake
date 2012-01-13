require "open-uri"

desc "deploy to server"
task :deploy do
  server = "TODO"
  user = "TODO"
  path = "TODO"

  system("git push #{user}@#{server}:#{path} origin/master:master") || fail("Failed to deploy")

  deployed_version = `git rev-parse --short HEAD`.chomp
  begin
    Timeout.timeout(60) do
      sleep 5 until open("http://#{server}/version").include? deployed_version
    end
  rescue Timeout::Error
    fail "Server not showing new version after one minute"
  end
end
