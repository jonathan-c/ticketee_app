Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end


Given /^I am signed in as them$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^"(.*?)" can view the "(.*?)" project$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^"(.*?)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(user: User.find_by_email(email))
    @project.tickets.create!(attributes)
  end
end