*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Begin webtest
    open browser    https://www.amazon.de/-/en/ref=nav_logo    chrome
    maximize browser window

End webtest
    close browser