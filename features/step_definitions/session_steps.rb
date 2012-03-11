Given "some sessions have been suggested" do
end

When "I suggest a session" do
  visit "/"
  click_link "Suggest a session"
  fill_in "Title", with: "My awesome talk"
  click_button "Submit"
end

Then "my session suggestion should appear on the home page" do
  visit "/"
  page.should have_content("My awesome talk")
end

Then "I should see some suggested sessions" do
  page.should have_selector("section#sessions h2")
end

Then "I should see the suggested session titles" do
  conference.sessions.each do |session|
    page.should have_content(session.title)
  end
end
