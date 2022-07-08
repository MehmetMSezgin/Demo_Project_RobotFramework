*** Variables ***
${MY_VALUE} =    100

*** Test Cases ***
IF statement
    run keyword if    ${MY_VALUE}>50    log    hi

IF/ELSE statement
    run keyword if    ${MY_VALUE}>200    Keyword1    ELSE    Keyword2

IF/ELSE statement alternative usage
    run keyword if    ${MY_VALUE}>200    Keyword1
    ...    ELSE    Keyword2

IF/IF ELSE statement
    run keyword if    ${MY_VALUE}>200    Keyword1    ELSE IF    ${MY_VALUE}==10    Keyword2    ELSE    keyword3

IF/IF ELSE statement alternative usage
    run keyword if    ${MY_VALUE}>200    Keyword1
    ...    ELSE IF    ${MY_VALUE}==10    Keyword2
    ...    ELSE    keyword3

*** Keywords ***
Keyword1
    log    k1

Keyword2
    log    k2

Keyword3
    log    k3