*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Dialogs

*** Variables ***
${DB_NAME} =    rftutorial
${DB_USER_NAME} =    rftutorial
${DB_USER_PASSWORD} =    Demoscript1!
${DB_HOST} =    sql1100.shared-servers.com
${DB_PORT} =    1090
${PREVIOUS_ROW_COUNT}

*** Test Cases ***
SQL test case
    connect
    save current row count
    get input data
    insert record
    verify new record added
    disconnect

*** Keywords ***
Connect
    connect to database    pymssql    ${DB_NAME}    ${DB_USER_NAME}    ${DB_USER_PASSWORD}    ${DB_HOST}    ${DB_PORT}

Save current row count
    ${current_row_count} =    row count    SELECT * FROM DemoItems      ##you dont need to use semicolon but if you want to do multiple querries you should use
    set suite variable    ${PREVIOUS_ROW_COUNT}    ${current_row_count}
    log    ${current_row_count}

Get input data
    ${name} =    get value from user  Enter name
    set suite variable    ${FIRST_NAME}    ${name}

Insert record
    execute sql string    INSERT INTO DemoITems (ItemName, FirstName) VALUES ('New Item: ' + CAST(GetDate()) as VARCHAR(50)), '${FIRST_NAME}');

Verify New Record Added
    ${new_row_count} =    row count    SELECT * FROM DemoITems;
    log    ${new_row_count}
    should be equal as numbers    ${new_row_count}    ${PREVIOUS_ROW_COUNT + 1}          ##Look at the variable !!!!!!!!!!! variable+1


Disconnect
    disconnect from database