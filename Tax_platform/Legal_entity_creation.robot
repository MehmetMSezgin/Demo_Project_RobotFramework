*** Settings ***
Library    SeleniumLibrary
Resource    credentials.robot
Test Setup    Test specific setup
Test Teardown    Test specific teardown

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
${BROWSER}    chrome
${input_username}    //input[@name='username']
${input_password}    //input[@name='password']
${login_button}    //button[@type='submit']
${recruitment_button}    //span[text()='Recruitment']
${add_button}    //button[@type='button' and text()=' Add ']

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
    click element    xpath=${recruitment_button}
    wait until element is visible    xpath=${add_button}    10

#6) Scroll down end of the list
    scroll element into view    xpath=//p[text()='. All rights reserved.']
    sleep    3s

#7) Scroll up and clisk on add
    scroll element into view    xpath=${add_button}
    click element    xpath=${add_button}


#8) Add a new entity
    wait until page contains element    xpath=//input[@name='firstName']
    click element    xpath=//input[@name='firstName']

    input text    xpath=//input[@name='firstName']    exampleuser
    press keys    xpath=//input[@name='firstName']    TAB

    press keys    xpath=//input[@name='middleName']    TAB
    input text    xpath=//input[@name='lastName']    usersurname

    input text    xpath=//input[@class='oxd-input oxd-input--active' and @placeholder='Type here'][1]    admin@example.com
    sleep    3s

    click element    xpath=//button[text()=' Save ']

#9) Validate the addition
    wait until page contains    Success
    wait until page contains    Application Stage    10


*** Keywords ***
Test specific setup
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Test specific teardown
    sleep    3s
    close all browsers

