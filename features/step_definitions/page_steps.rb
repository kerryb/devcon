When /^I visit the (.*)$/ do |page|
  visit path_for_page(page)
end

Then /^I should be (?:redirected to|on) the (.*)$/ do |page|
  current_url.should == url_for_page(page)
end
