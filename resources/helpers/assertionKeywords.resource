*** Settings ***
Documentation    This are all Keywords to help assertion 
Library    Browser

*** Keywords ***
Element Text Should Be
    [Arguments]    ${description}    ${locator}
    Get Text    ${locator}    should be    ${description}

