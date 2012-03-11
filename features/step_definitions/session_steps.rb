Given "some sessions have been suggested" do
end

Then "I should see some suggested sessions" do
  page.should have_selector("section#sessions h2")
end

Then "I should see the suggested session titles" do
  conference.sessions.each do |session|
    page.should have_content(session.title)
  end
end
