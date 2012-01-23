Given "some proposals have been made" do
end

Then "I should see some proposals" do
  page.should have_content("<h2>")
end

Then "I should see the proposal titles" do
  proposals.each do |proposal|
    page.should have_content(proposal.title)
  end
end
