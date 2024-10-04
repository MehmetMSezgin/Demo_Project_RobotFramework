*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Start Testcase
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Finish Testcase
    close browser