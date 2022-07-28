*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
Should be able to search for product
    [Tags]    addItem
    open browser    https://www.amazon.de/-/en/ref=nav_logo    chrome
    maximize browser window
    sleep    3s
    click button    id=sp-cc-accept
    input text    id=twotabsearchtextbox    Nba hoodie zipper
    click button    xpath=//input[@id='nav-search-submit-button']
    sleep    3s
    wait until element is enabled    xpath=(//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal'])[2]
    click element    xpath=(//a[@class='a-link-normal s-underline-text s-underline-link-text s-link-style a-text-normal'])[2]
    wait until page contains element    id=add-to-cart-button
    click element    xpath=//a[@class='a-button-text a-text-left']
    wait until page contains    Sign In
    close browser
*** Keywords ***
