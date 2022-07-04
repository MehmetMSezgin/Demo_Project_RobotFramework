*** Settings ***
Resource    Resources/Common.robot
Library    ../myPythonLibrary.py
Test Setup    Common.Begin webtest
Test Teardown    Common.End webtest

*** Variables ***
${URL} =    https://www.amazon.de/-/en/ref=nav_logo
${BROWSER} =    chrome

*** Test Cases ***
tc1
    myPythonLibrary.python function