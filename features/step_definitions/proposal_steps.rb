Given "some proposals have been made" do
end

Then "I should see some proposals" do
  page.should have_selector("section#proposals h2")
end

Then "I should see the proposal titles" do
  conference.proposals.each do |proposal|
    page.should have_content(proposal.title)
  end
end
