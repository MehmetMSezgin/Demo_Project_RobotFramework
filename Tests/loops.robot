*** Settings ***
Library    String

*** Variables ***
${Index}
*** Test Cases ***
For loop with upper bounds range
    [Documentation]  0 based range
    FOR    ${Index}    IN RANGE    5
        keyword1    ${Index}
        ${RANDOM_STRING} =    generate random string    ${Index}
        log    ${RANDOM_STRING}
    END

Loop with start , finish range
    [Documentation]    provided starting point
    FOR    ${Index}    IN RANGE    7    9
        keyword1    ${Index}
        ${Random_string} =    generate random string    ${Index}
        log    ${Random_string}
    END

Loop with start, finish and step range
    [Documentation]    the counter will jump by 2 each time
    FOR    ${Index}    IN RANGE    1    10    2
        keyword1    ${Index}
        ${string} =    generate random string    ${Index}
        log    ${string}
    END

Loop with list
    @{Cities} =    create list    boston    NY    london    paris

    FOR    ${city}    IN    @{Cities}
        log    ${city}
    END

Exit for a loop
    @{TEAMS} =    create list    LA    OKC    NoLA    LAC    MLW    Toronto

    FOR    ${team}    IN    @{TEAMS}
        log    ${team}
        run keyword if    "${team}" == "MLW"    exit for loop
        log    continuing...
    END

    log    out of the loop

Repeat keyword many times
    repeat keyword    5    microfon show
    repeat keyword    2 times    microfon show
    #repeat keyword    1 m 10 s    microfon show
    repeat keyword    3 s    microfon show


*** Keywords ***
keyword1
    [Arguments]  ${Passed_index}
    log    passed a value of ${Passed_index}

microfon show
    log    MAMINIMAMINI