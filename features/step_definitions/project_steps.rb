Given /^I am on the homepage$/ do
  visit('/')
end

When /^I navigate to the new project creation page$/ do
  click_link('New Project')
end

When /^I create a new project$/ do
  fill_in('Name', with: 'TextMate 2')
  click_button('Create Project')
end

Then /^I should be shown the project created verification message$/ do
  page.should have_content("Project has been created.")
end

Then /^I should be on the project page for the new project$/ do
  current_path.should == project_path(Project.find_by_name!('TextMate 2'))
  page.should have_content("TextMate 2 - Projects - Ticketee")
end


Then /^I try to create a project without a name$/ do
  click_button('Create Project')
end

Then /^I should be informed that the project has not been created$/ do
  page.should have_content("Project has not been created.")
end

Then /^I should be told that the name is required$/ do
  page.should have_content("Name can't be blank")
end

Given /^there is a project called "(.*?)"$/ do |name|
  @project = FactoryGirl.create(:project, name: name)
end

When /^I follow "(.*?)"$/ do |page|
  click_link(page)
end

Then /^I should be on the project page for "(.*?)"$/ do |page|
  current_path.should == project_path(Project.find_by_name!(page))
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |name, project|
  fill_in(name, with: project)
end

When /^I press "(.*?)"$/ do |update|
  click_button(update)
end

Then /^I should see "(.*?)"$/ do |success|
  page.should have_content(success)
end

Then /^I should not see "(.*?)"$/ do |name|
  page.should_not have_content(name)
end
