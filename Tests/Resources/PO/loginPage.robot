*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
use credentials
    [Arguments]    ${EMAIL}
    input text    id:ap_email    ${EMAIL}
    sleep    3s