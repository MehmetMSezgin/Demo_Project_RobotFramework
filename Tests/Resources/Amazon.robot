*** Settings ***
Library    SeleniumLibrary
Resource    PO/TopNav.robot
Resource    PO/loginPage.robot

*** Variables ***
${PRODUCT} =    xpath=//span[contains(text(),'Chevron Full Zip Hoodie NBA Back Cut Team Colour Contrast Zip Hoodie')]

*** Keywords ***
Search for products
    [Documentation]    Here one object model has been used as example
    sleep    3s
    click button    id=sp-cc-accept
    TopNav.Write product name and click
    sleep    3s
    wait until element is visible    ${PRODUCT}

Verify search completed
    wait until page contains    results for "${SEARCH_TERM}"                #write variable in double quote.
    ##it is complaining because I defined variable in resourcesUsedTC.robot     --- But it works
Select product
    click element    ${PRODUCT}
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

Login
    [Arguments]    ${EMAIL}
    loginPage.use credentials    ${EMAIL}