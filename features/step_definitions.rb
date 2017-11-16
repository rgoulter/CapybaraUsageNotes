Given(/^a html file "([^"]*)" contents with$/) do |filename, html_content|
  File.write(filename, html_content)
end

When(/^the program executes the following Ruby code:$/) do |ruby_code|
  require 'tempfile'
  tmp = Tempfile.new(['cucumber_capybara', 'rb'])
  tmp.write(ruby_code)
  tmp.close
  @output = `ruby #{tmp.path}`
end

Then(/^the program should output$/) do |expected_output|
  expect(@output.chomp).to be == expected_output
end
