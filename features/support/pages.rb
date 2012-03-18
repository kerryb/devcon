def path_for_page page
  path = case page
         when "live site" then "http://devcon.heroku.com/"
         when /^(site|home page)$/ then root_path
         when "login page" then login_path
         when "new session page" then new_session_path
         else raise "Unknown page: '#{page}'"
         end
end

def url_for_page page
  "http://#{host}#{path_for_page(page)}"
end
