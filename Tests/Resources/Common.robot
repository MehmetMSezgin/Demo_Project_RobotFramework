*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Begin webtest
    open browser    https://www.amazon.de/-/en/ref=nav_logo    chrome
    maximize browser window

End webtest
    close browser

Insert Testing data
    Log    setting up test data...
    keyword1

Cleanup Testing data
    Log    clearing test data...

keyword1
    Log    keyword1...