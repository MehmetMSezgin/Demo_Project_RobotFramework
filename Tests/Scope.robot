*** Settings ***
Resource    Resources/Scope_presedence.robot

*** Variables ***
${MY_VARIABLE} =    global variable
${PRESEDENCE} =    From the script file
*** Test Cases ***
Create and log a variable
    ${my_variable} =    Set variable    local variable         ##this is local only can be used in that test case
    log    ${my_variable}
    log    ${PRESEDENCE}       ##Already I have ${PRESEDENCE} in resources file but here in VARIABLES i OVERRIDE and it will show what it is written in variables
Access a variable
    log    ${MY_VARIABLE}
*** Keywords ***
