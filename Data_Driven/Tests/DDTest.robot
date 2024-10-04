*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    ../TestData/TestData.csv             ##python intepreterden robotframework-datadriver i indir
Resource   Common.robot

Suite Setup    Common.Start Testcase
Suite Teardown    Common.Finish Testcase
Test Template    Invalid login scenarios

*** Variables ***
${URL} =    https://www.saucedemo.com/
${BROWSER} =    chrome
${txtbox_username} =    id=user-name
${txtbox_password} =    id=password
${login_button} =    id=login-button
${txt_error} =    xpath=//*[@id="login_button_container"]//h3

*** Test Cases ***
Verify login fails with invalid credentials  ${username}    ${password}    ${error_msg}

*** Keywords ***
Invalid login scenarios
    [Arguments]    ${username}    ${password}    ${error_msg}      ##it should match with csv file arguments
    input text    ${txtbox_username}    ${username}
    input text    ${txtbox_password}    ${password}
    click button    ${login_button}
    sleep    2s
    element should contain    ${txt_error}    ${error_msg}



