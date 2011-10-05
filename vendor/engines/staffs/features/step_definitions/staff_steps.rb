Given /^I have no staffs$/ do
  Staff.delete_all
end

Given /^I (only )?have staffs titled "?([^\"]*)"?$/ do |only, titles|
  Staff.delete_all if only
  titles.split(', ').each do |title|
    Staff.create(:name => title)
  end
end

Then /^I should have ([0-9]+) staffs?$/ do |count|
  Staff.count.should == count.to_i
end
