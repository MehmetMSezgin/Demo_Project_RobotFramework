*** Settings ***
#TODO
Resource    Resources/Common.robot
Resource    Resources/Amazon.robot
# As you see you can use Common.Begin webtest or just Begin webtest
Suite Setup    Insert Testing data
Test Setup    Common.Begin webtest
Test Teardown    End webtest
Suite Teardown    Cleanup Testing data

*** Variables ***
${URL} =    https://www.amazon.de/-/en/ref=nav_logo
${BROWSER} =    chrome
${SEARCH_TERM} =    Nba Hoodie Zipper

*** Test Cases ***
Try out
    [Tags]    tryOut
    set log level    debug      ##In your report for extra info

User must sign in to check out
    [Documentation]    This is amazon must sign in test case
    [Tags]    Smoke
    #set log level    debug      ##In your report for extra info
    Amazon.Search for products
    ${ReturnedInfo} =    Amazon.Verify search completed
    log    ${ReturnedInfo}
    Amazon.Select product
    Amazon.Add product to chart
    #set log level    info     ##In your report for extra info

Other test case
    [Documentation]    This has been generated to test test setup and test teardown
    [Tags]    cmd
    Amazon.Search for products

Logged out user must sign in to check out (Gherkin Language)
    [Documentation]    Gherkin lang example
    [Tags]    Gherkin
    Given User not logged in
    And User searches and add product to cart
    Then User is required to sign in