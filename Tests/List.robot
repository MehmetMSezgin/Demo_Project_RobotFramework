*** Settings ***

*** Variables ***
@{LIST_VARIABLE} =    Variable 1    Variable 2    Variable 3

*** Test Cases ***
List variable example
    Log    @{LIST_VARIABLE} [0]               # variable - space - index number
    Log    @{LIST_VARIABLE} [1]
    Log    @{LIST_VARIABLE} [2]

Set list of variable in test case
    @{list_variable} =    create list    item1    item2    item3      ##Robot fr recommends use "create list" instead of "set variables"
    Log    @{list_variable} [0]
    Log    @{list_variable} [1]