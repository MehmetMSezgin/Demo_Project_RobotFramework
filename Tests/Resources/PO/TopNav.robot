*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_BAR} =    id=twotabsearchtextbox
${SEARCH_BUTTON} =    xpath=//input[@id='nav-search-submit-button']
*** Keywords ***
Write product name and click
    input text    ${SEARCH_BAR}    ${SEARCH_TERM}
        ##it is complaining because I defined variable in resourcesUsedTC.robot     --- But it works
    click button    ${SEARCH_BUTTON}
