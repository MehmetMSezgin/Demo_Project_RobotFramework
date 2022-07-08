*** Settings ***
Library    SeleniumLibrary
Resource    Resources/Common.robot
Test Setup    Common.Begin webtest
Test Teardown    Common.End webtest

*** Variables ***
${URL} =    https://www.amazon.de/
${BROWSER} =    chrome

*** Test Cases ***
Locator practice Image
    [Tags]    this
    log    locator practice...
    click cookies
    click image    Headphones




*** Keywords ***
Click cookies
    click element    id=sp-cc-accept