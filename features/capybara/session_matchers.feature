Feature: Capybara::SessionMatchers
    Background:
        Given a html file "wait.html" contents with
          """html
          <script>
          function delayedVisit() {
              setTimeout(function() {
                  window.location.href = 'foo.html';
              }, 1500);
          }
          </script>
          <a href="#" onclick="delayedVisit();">Link</a>
          """

    Scenario: Capybara::SessionMatchers#assert_current_path can tolerate delays
         When the program executes the following Ruby code:
           """ruby
           require 'capybara'
           Capybara.default_driver = :selenium
           Capybara.current_session.visit('http://localhost:8000/wait.html')
           Capybara.current_session.find('a').click
           Capybara.current_session.assert_current_path('/foo.html', wait: 10)
           puts 'Output'
           """
         Then the program should output
           """
           Output
           """

    # What about when URL target takes a long time to be served?
    Scenario: Capybara::SessionMatchers#assert_current_path will throw Capybara::ExpectationNotMet if link takes too long
         When the program executes the following Ruby code:
           """ruby
           require 'capybara'
           Capybara.default_driver = :selenium
           Capybara.current_session.visit('http://localhost:8000/wait.html')
           Capybara.current_session.find('a').click
           begin
             Capybara.current_session.assert_current_path('/foo.html', wait: 1)
           rescue Capybara::ExpectationNotMet
             puts 'Output'
           end
           """
         Then the program should output
           """
           Output
           """

    Scenario: expect(session).not_to have_current_path fails if at that path and doesn't wait
         When the program executes the following Ruby code:
           """ruby
           require 'capybara'
           require 'rspec/expectations'
           include ::RSpec::Matchers
           Capybara.default_driver = :selenium
           Capybara.current_session.visit('http://localhost:8000/wait.html')
           Capybara.current_session.find('a').click
           begin
             expect(Capybara.current_session).not_to have_current_path('/foo.html', wait: 5)
           rescue RSpec::Expectations::ExpectationNotMetError
             puts 'Output'
           end
           """
         Then the program should output
           """
           Output
           """

