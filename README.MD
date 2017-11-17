# Usage Notes for Capybara

This repo contains Cucumber specifications which document usage notes on
using Capybara.

# Prerequisites / Usage

- [Cucumber](https://github.com/cucumber/cucumber-ruby)
- [Capybara](https://github.com/teamcapybara/capybara)
- [Selenium-WebDriver](https://github.com/SeleniumHQ/selenium/tree/master/rb)
- [RSpec Expectations](https://github.com/rspec/rspec-expectations)

With Ruby installed, the above can be installed with:

```
gem install capybara cucumber rspec selenium-webdriver
```

The tests use Chrome browser by default, which requires
[ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads).

The tests can be run by calling `cucumber` from the project root.
