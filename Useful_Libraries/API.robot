*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary

*** Test Cases ***
Make a simple REST API call
    [Tags]    api
    Check github username



*** Keywords ***
Check github username
    #create session
    create session    my_github_session    https://api.github.com      #first one is nick name second one is url
    #make the call
    ${response} =    get on session    my_github_session    users/robotframeworktutorial        #this is resyt of URL to make api call
    #response status
    should be equal as strings    ${response.status_code}    200
    #check response body
    ${json} =    set variable    ${response.json()}       #create variable and put json file inside
    should be equal as strings    ${json['login']}    robotframeworktutorial
    log    ${json}

