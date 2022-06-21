*** Settings ***
Resource    Resources/Common.robot
Resource    Resources/Amazon.robot
# As you see you can use Common.Begin webtest or just Begin webtest
Suite Setup    Insert Testing data
Test Setup    Common.Begin webtest
Test Teardown    End webtest
Suite Teardown    Cleanup Testing data

*** Test Cases ***
User must sign in to check out
    [Documentation]    This is amazon must sign in test case
    [Tags]    Smoke
    Amazon.Search for products
    Amazon.Select product
    Amazon.Add product to chart

Other test case
    [Documentation]    This has been generated to test test setup and test teardown
    Amazon.Search for products

Logged out user must sign in to check out (Gherkin Language)
    [Documentation]    Gherkin lang example
    [Tags]    Gherkin
    Given User not logged in
    And User searches and add product to cart
    Then User is required to sign in