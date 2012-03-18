Given "I am logged in" do
  steps %{
    When I visit the site
    And I log in
  }
end

When "I log in" do
  fill_in "EIN", with: "802285285"
  fill_in "Password", with: "secret"
  click_button "Log in"
end

When "I log out" do
  click_link "Log out"
end

Then "I should not be logged in" do
  visit "/"
  current_url.should == login_url
end
