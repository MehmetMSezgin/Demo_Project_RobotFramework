*** Settings ***

*** Variables ***
${MY_VARIABLE} =    HELLO

#Multiple values


*** Test Cases ***
Set a variable in the test case
    ${my_new_variable} =    Set variable    Something...
    Log    ${my_new_variable}

Variable demonstration
    Log     ${MY_VARIABLE}

