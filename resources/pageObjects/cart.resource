*** Settings ***
Library    Browser

*** Keywords ***
Check cart article
    [Arguments]    ${article}
    Get Element    xpath=//a[.="${article}"]
