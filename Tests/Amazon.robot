*** Settings ***
Documentation    This is some basic infor about the whole suite
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
User should be required to sign in when checking out
    [Documentation]    This is some basic info about test case
    [Tags]    Smoke
    open browser    https://www.amazon.de/-/en/ref=nav_logo    chrome
    sleep    3s
    close browser

*** Keywords ***
