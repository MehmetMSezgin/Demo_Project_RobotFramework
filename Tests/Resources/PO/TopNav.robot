*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Write product name and click
    input text    id=twotabsearchtextbox    Nba hoodie zipper
    click button    xpath=//input[@id='nav-search-submit-button']