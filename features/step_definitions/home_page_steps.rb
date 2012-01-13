When "I visit the site" do
  visit "/"
end

Then "I should see a welcome page" do
  page.should have_content("Welcome to the DevCon site")
end
