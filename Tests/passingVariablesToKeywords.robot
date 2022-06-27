*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
Test case 1
    Begin the webtest    http://www.amazon.com    chrome

Test case 2
    Begin the webtest    http://www.google.com    chrome

Test case 3 with local list
    @{url_and_browser} =    create list    http://www.amazon.com    chrome
    Begin the webtest 2    @{url_and_browser}
*** Keywords ***
Begin the webtest
    [Arguments]    ${url}    ${browser}
    open browser    ${url}    ${browser}
    close browser

Begin the webtest 2
    [Arguments]    @{url_and_browser}
    open browser    @{url_and_browser}
    close browser