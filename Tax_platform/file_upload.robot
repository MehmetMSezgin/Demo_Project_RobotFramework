*** Settings ***
Library    SeleniumLibrary
Test Setup    Test Specific Setup
Test Teardown    Test Specific Teardown

*** Variables ***
${URL}    https://the-internet.herokuapp.com/upload
${BROWSER}    chrome

*** Test Cases ***
Verify file uploading

    wait until page contains element    id=file-upload
    ${image_path}    set variable    ${CURDIR}
    choose file    id=file-upload    ${CURDIR}/dummy.jpg
    sleep    3s
    click element    id=file-submit
    wait until page contains    File Uploaded!
    sleep    2s

*** Keywords ***
Test Specific Setup
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Test Specific Teardown
    sleep    3s
    close all browsers