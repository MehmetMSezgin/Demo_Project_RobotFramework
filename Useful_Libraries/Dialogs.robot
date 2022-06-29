*** Settings ***
Library    Dialogs
Library    SeleniumLibrary
*** Variables ***
${WEBSITE} =    https://www.google.com/

*** Test Cases ***
Change web site
    [Tags]    Web
    open browser    ${WEBSITE}    chrome
    ${new_browser} =    get selection from user    Which website    https://www.hs.fi/    https://robotframework.org/
    ##you can select manually
    set global variable    ${WEBSITE}    ${new_browser}
    open browser    ${new_browser}    chrome
    close all browsers

Manual selection
    [Tags]    selection
    open browser    ${WEBSITE}    chrome
    execute manual step    Choose pass or fail    this message is optional    #it pauses the process and let you to check smt
    pause execution         #it stops until you click ok
    close browser
