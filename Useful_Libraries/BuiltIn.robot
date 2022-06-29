*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${GLOBAL1} =    Global variable 1

*** Test Cases ***
Declare and set variables
    ${local_variable1} =    set variable    this is only abaible in test case
    set test variable    ${local_variable2}    this is also only avaible in test case

    set suite variable    ${suite_variable}    this is avaible within all tests in suite

    set global variable    ${GLOBAL2}    THIS IS AVAIBLE EVERYWHERE

Logging stuff
    [Tags]    BuiltIn
    comment    ${unset_variable}     #even if it does not defined, it wont throw error
    comment    any string comment
    comment    ${GLOBAL1}          ##    --- you can not see what this variable contains in report
    log    some explanation can be written
    log many    multiple explanation1    multiple explanation2
    log to console    this will be seen in only console, not the log
    log    ${GLOBAL1}         ##    --- you can see what this variable contains in report

Ignore failures in this test
    [Tags]    try
    open browser    https://www.hs.fi/    chrome
    #it contiunues the test even if there is a error
    run keyword and continue on failure    wait until page contains    a text which does not contain

    close browser

Repeat things
    [Tags]    try1
    repeat keyword    3 times    repeated word
    ##Examples:
    ##    | Repeat Keyword | 5 times   | Go to Previous Page |
    ##    | Repeat Keyword | ${var}    | Some Keyword | arg1 | arg2 |
    ##    | Repeat Keyword | 2 minutes | Some Keyword | arg1 | arg2 |

*** Keywords ***
repeated word
    log    word