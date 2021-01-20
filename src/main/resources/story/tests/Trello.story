GivenStories: story/tests/Precondition.story

Scenario: Sign in
Given I am on the main application page
When I go to the relative URL '/login'
When I enter `${UserEmail}` in field located `By.xpath(//input[@id="user"])`
When I click on element located `By.xpath(//input[@id="login"])`
When I enter `${UserPass}` in field located `By.xpath(//input[@id="password"])`
When I click on element located `By.xpath(//button[@id="login-submit"])`
When I wait until the page has the title 'Boards | Trello'

Scenario: API
When I set request headers:
|name         |value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|cookie       |eyJraWQiOiJzZXNzaW9uLXNlcnZpY2VcL3Byb2QtMTU5Mjg1ODM5NCIsImFsZyI6IlJTMjU2In0.eyJhc3NvY2lhdGlvbnMiOltdLCJzdWIiOiI2MDAxNjA0MWRkNWViNTAxMDgzMGJmMTIiLCJlbWFpbERvbWFpbiI6ImdtYWlsLmNvbSIsImltcGVyc29uYXRpb24iOltdLCJjcmVhdGVkIjoxNjExMDQwODM3LCJyZWZyZXNoVGltZW91dCI6MTYxMTA0NTg0NiwidmVyaWZpZWQiOnRydWUsImlzcyI6InNlc3Npb24tc2VydmljZSIsInNlc3Npb25JZCI6IjJiZmI2MWIwLWY0ZjgtNDI0NC05ZWE5LWE5MTIxZGE0NDg4YSIsImF1ZCI6ImF0bGFzc2lhbiIsIm5iZiI6MTYxMTA0NTI0NiwiZXhwIjoxNjEzNjM3MjQ2LCJpYXQiOjE2MTEwNDUyNDYsImVtYWlsIjoidml2aWR1cy50ZXN0LnRlc3RAZ21haWwuY29tIiwianRpIjoiMmJmYjYxYjAtZjRmOC00MjQ0LTllYTktYTkxMjFkYTQ0ODhhIn0.K3TR5yfIgOhpcME-JqVLyV7QArkgJKTZkQIfyPTqiXobfNSlv18DF2bkdNui0WsaZ8vlwM3fY59OWTjwEz-l_gAX7QRKKFgh7RrfczvCzmI1aCbJEroHsjGS_4br4BPBbQh9dv0aQlqlyMCRjJ3NN2bIkGqPfMzhj3tU8LgHQDKVILcbF1Z5FYqD3TSYbUZltokPYCPLM5ww9cbCUosKsq2cSgg-rydGsUXNNcHb3G2X2FoZzW9v0a24Lo0JPahWdWkjP-Vi-YvIN1G8Xsyyt83BQBKhZM8_yBHV1NAKobbLzZC75vNRKOXDEDKF5na8nkZw4KpDuAX-WQVSHcfPHA	|
Given request body: {
"name": "TestBoard"
}
When I send HTTP POST to the relative URL '/1/boards?name=TestBoard&key=6a524a47a160b1a636edb7c434167a45&token=1e73e41466832746b6c41d67a2c317359347766650321bf4e3d78fe651ed5aa8'
Then the response code is equal to '200'

Scenario: Visual checks
When I establish baselines for each tab

Scenario: Check presence of some elements+compare against visual checks
When I go to the relative URL '/${teamName}'
When I compare against baseline with `Boards` ignoring:
|ELEMENT                                          |
|By.xpath(//div[@class="boards-page-layout-list"])|
Then the text 'testTeam' exists
When I go to the relative URL '/${teamName}/members'
When I compare against baseline with `Members` ignoring:
|ELEMENT                                               |
|By.xpath(//div[@class="org-members-page-layout-list"])|
Then field located `By.xpath(//input[@class="org-members-page-navigation-input"])` exists
When I go to the relative URL '/${teamName}/billing'
When I compare against baseline with `UpgradeTeam` ignoring:
|ELEMENT            |
|By.xpath(//table)  |
When I change context to element located `By.xpath(//table)`
Then the context has a width of '61'%

Scenario: UI Verification of the elements using nested steps
When I go to the relative URL '/testteam123456789'
When I find <= '1' elements by By.xpath(//div[@class="board-tile mod-add"]) and for each element do
|step|
|When I change context to element located `By.xpath(//div[@class="board-tile mod-add"])`|
|Then the context element has the CSS property 'height'='80px'                          |
When I go to the relative URL '/testteam123456789/members'
When I find <= '1' elements by By.xpath(//input[@class="org-members-page-navigation-input"]) and for each element do
|step|
||When I change context to element located By.xpath(//input[@class="org-members-page-navigation-input"])|
|Then the context element has the CSS property 'font-family' containing 'Roboto'|
When I go to the relative URL '/testteam123456789/billing'
When I find <= '1' elements by By.xpath(//button[@class="voB8NatlbuEme5 _21upOlzpUQJcdT"]) and for each element do
|step|
|When I change context to element located `By.xpath(//button[@class="voB8NatlbuEme5 _21upOlzpUQJcdT"])`|
|Then the context element has the CSS property 'background-color' containing '#5aac44'|

Scenario: Known-issues added
Given I am on the main application page
When I click on element located `By.xpath(//button[@class="add_button"])`
When I click on element located `By.xpath(//a[@class="boards-page-board-section-header-options-item"])`
When I compare against baseline with `Boards`
