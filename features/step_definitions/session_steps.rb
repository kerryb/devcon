Given "some sessions have been suggested" do
  suggest_session title: "How to run a devcon"
  suggest_session title: "Robot battle"
end

When "I suggest a session" do
  click_link "Suggest a session"
  fill_in "Title", with: "My awesome talk"
  fill_in "Description", with: "You don't want to miss this!"
  click_button "Submit"
end

Then "I should see some suggested sessions" do
  page.should have_selector("section#sessions h2")
end

Then "my session suggestion should appear on the home page" do
  page.should have_content("My awesome talk")
  page.should have_content("You don't want to miss this!")
end

Then "the date and time the session was suggested should be displayed" do
  session = conference.sessions.last
  date = session.created_at.strftime("%d %b %Y")
  time = session.created_at.strftime("%H:%M")
  page.should have_content("at #{time} on #{date}")
end

Then "the session should show my name" do
  page.should have_content("Suggested by #{user.name}")
end

Then "my name should link to my e-mail address" do
  fail "TODO"
end

Then "I should see the suggested session titles" do
  sessions.each do |session|
    page.should have_content(session.title)
  end
end
