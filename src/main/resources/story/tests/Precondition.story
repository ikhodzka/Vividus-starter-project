Scenario: Signing Up
Given I am on the main application page
When I go to the relative URL '/signup'
When I initialize the story variable `UserEmail` with value `<email>`
When I initialize the story variable `UserFullName` with value `<FullName>`
When I initialize the story variable `UserPass` with value `<Password>`
When I enter `${UserEmail}` in field located `By.xpath(//input[@id="email"])`
When I click on element located `By.xpath(//input[@id="signup-submit"])`
Then the text 'Sign up for your account' exists
When I find <= '1' elements by By.xpath(//form[@id="form-sign-up"]) and for each element do
|step|
|When I wait until the page has the title 'Sign up - Log in with Atlassian account'    |
|When I change context to element located `By.xpath(//form[@id="form-sign-up"])`       |
|When I enter `${UserFullName}` in field located `By.xpath(//input[@id="displayName"])`|
|When I enter `${UserPass}` in field located `By.xpath(//input[@id="password"])`       |
|When I click on element located `By.xpath(//button[@id="signup-submit"])`             |
When I find <= '1' elements by By.xpath(//div[@id="login-prompt"]) and for each element do
|step|
|When I wait until the page has the title 'Create a Trello Account'             |
|When I change context to element located `By.xpath(//div[@id="signup-form"])`  |
|When I click on element located `By.xpath(//span[@class="atlassian-link"])`    |
|When I click on element located `By.xpath(//button[@id="login-submit"])`       |
|When I enter `${UserPass}` in field located `By.xpath(//input[@id="password"])`|
|When I click on element located `By.xpath(//button[@id="login-submit"])`       |
Examples:
|email                                               |FullName                                   |Password                                       |
|#{generate(regexify'[a-z]{5}[1-9]{2}')}@test.com    |#{generate(regexify'[a-z]{5}_[a-z]{5}')}1  |#{generate(regexify'[A-Z]{1}[a-z]{5}[1-9]{2}')}|
|#{generate(regexify'[a-z]{5}[1-9]{2}')}@test.com    |#{generate(regexify'[a-z]{5}_[a-z]{5}')}2  |#{generate(regexify'[A-Z]{1}[a-z]{5}[1-9]{2}')}|
|vividus.test.test@gmail.com                         |User User3                                 |Vividus123456                                  |
