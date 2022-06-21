*** Settings ***
Library    SeleniumLibrary
Resource    PO/TopNav.robot
*** Keywords ***
Search for products
    [Documentation]    Here one object model has been used as example
    sleep    3s
    click button    id=sp-cc-accept
    TopNav.Write product name and click
    sleep    3s
    wait until element is visible    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[5]/div/div/div/div/div[2]/div[1]/h2/a/span

Select product
    click element    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[5]/div/div/div/div/div[2]/div[1]/h2/a/span
    wait until page contains element    id=add-to-cart-button

Add product to chart
    click element    xpath=//a[@class='a-button-text a-text-left']
    wait until page contains    Sign In
    element text should be    //h1[@class='a-spacing-small']    Sign In

User not logged in
    page should contain    Hello, Sign in

User searches and add product to cart
    Search for products
    Select product
    Add product to chart

User is required to sign in
    page should contain    Sign In