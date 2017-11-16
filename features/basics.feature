Feature: Basics of Capybara
    # cf. cheatsheet at https://gist.github.com/zhengjia/428105
    Scenario: Simple scn
        Given a html file "foo.html" contents with
          """html
          <ul>
            <li>Output</li>
          </ul>
          """
         When the program executes the following Ruby code:
           """ruby
           require 'capybara'
           Capybara.default_driver = :selenium
           Capybara.current_session.visit('http://localhost:8000/foo.html')
           puts Capybara.current_session.find(:css, 'ul li').text
           """
         Then the program should output
           """
           Output
           """

   # etc.
