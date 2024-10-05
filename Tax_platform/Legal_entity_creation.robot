*** Settings ***
Library    SeleniumLibrary
Resource    credentials.robot
Test Setup    Test specific setup
Test Teardown    Test specific teardown

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/auth/login
${BROWSER}    chrome
${input_username}    //input[@name='username']
${input_password}    //input[@name='password']
${login_button}    //button[@type='submit']
${recruitment_button}    //span[text()='Recruitment']

*** Test Cases ***
Verify legal entity creation
# Test scenario
#1) Open the browser
#2) Navigate to Demo-orange
    log    Browser opened and navigated to Demo-orange

#3) Enter registered username in username textbox
#4) Enter password in password textbox
    wait until element is visible    xpath=${input_username}    10
    title should be    OrangeHRM
    input text    xpath=${input_username}    ${USERNAME}
    input text    xpath=${input_password}    ${PASSWORD}
    click element    xpath=${login_button}


#5) Verify login and navigate to Recruitment
    wait until element is visible    xpath=${recruitment_button}    10



#6) Scroll down end of the list
#7) Scroll up and clisk on add
#8) Add a new entity
#9) Validate the addition




*** Keywords ***
Test specific setup
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Test specific teardown
    sleep    3s
    close all browsers

