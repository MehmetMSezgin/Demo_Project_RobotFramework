*** Settings ***
Resource    /Resources/Amazon.robot
Resource    /Resources/Common.robot

*** Test Cases ***
User must sign in to check out
    Common.Begin webtest
    Amazon.Search for products
    Amazon.Select product
    Amazon.Add product to chart
    Common.End webtest