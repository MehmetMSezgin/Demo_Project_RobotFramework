*** Settings ***
Library    SeleniumLibrary



*** Keywords ***
Begin webtest
    open browser    ${URL}    ${BROWSER}         ##    ##it is complaining because I defined variable in resourcesUsedTC.robot     --- But it works
    maximize browser window

End webtest
    sleep    3s
    close browser

Insert Testing data
    Log    setting up test data...
    keyword1

Cleanup Testing data
    Log    clearing test data...

keyword1
    Log    keyword1...