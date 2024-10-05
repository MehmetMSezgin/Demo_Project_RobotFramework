*** Settings ***
Library    SeleniumLibrary
Test Setup    Test specific setup
Test Teardown    Test specific teardown

*** Variables ***
${URL}    https://www.aibidia.com/platform?utm_source=google&utm_medium=cpc&utm_campaign=20914389980&utm_content=160285074391&utm_term=aibidia&gad_source=1&gclid=CjwKCAjwx4O4BhAnEiwA42SbVC_mc2YdIyu91B5fKpyayM7DzApd6eg5Ma-2Ixz-cAh_6iInbtlI6RoCXvIQAvD_BwE
${BROWSER}    chrome
${main_page_sign_in_button}    //div[text()='Sign In']
${sign_in_with_google}    GoogleExchange
${input_email}    identifierId
${input_password}    x

*** Test Cases ***
Assignment 1- Verify google sign-in
# Test scenario
#1) Open the browser
#2) Enter the URL
#3) Click on My Account Menu
#4) Enter registered username in username textbox
#5) Enter password in password textbox
#6) Click on login button
#7) User must successfully login to the web page

    # click on sign in button
    wait until element is visible    xpath=${main_page_sign_in_button}
    title should be    The Aibidia Platform
    click element    xpath=${main_page_sign_in_button}

    # switch to Aibidia Sign in tab
    ${all_windows}=    get window handles
    switch window    ${all_windows[1]}
    wait until element is visible    id=${sign_in_with_google}    20
    title should be    Aibidia Sign in

    # click on sign in with google
    click element    id=${sign_in_with_google}
    wait until element is visible    id=${input_email}
    input text    id=${input_email}    example@email.com
    sleep    3s






*** Keywords ***
Test specific setup
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Test specific teardown
    sleep    3s
    close all browsers

