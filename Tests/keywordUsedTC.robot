*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
User must sign in to check out
    [Tags]    addItem
    Begin webtest
    Search for products
    Select product
    Add product to chart
    End webtest

*** Keywords ***
Begin webtest
    open browser    https://www.amazon.de/-/en/ref=nav_logo    chrome
    maximize browser window
Search for products
    sleep    3s
    click button    id=sp-cc-accept
    input text    id=twotabsearchtextbox    Nba hoodie zipper
    click button    xpath=//input[@id='nav-search-submit-button']
    sleep    3s
    wait until element is visible    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[5]/div/div/div/div/div[2]/div[1]/h2/a/span

Select product
    click element    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[5]/div/div/div/div/div[2]/div[1]/h2/a/span
    wait until page contains element    id=add-to-cart-button

Add product to chart
    click element    xpath=//a[@class='a-button-text a-text-left']
    wait until page contains    Sign In
    element text should be    //h1[@class='a-spacing-small']    Sign In

End webtest
    close browser
