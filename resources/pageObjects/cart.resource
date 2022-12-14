*** Settings ***
Library    Browser

*** Variables ***
&{cartLocator}    order=//a[.="Commander"]

*** Keywords ***
Check cart article
    [Arguments]    ${article}
    Get Element    xpath=//a[.="${article}"]
Go to order
    Click    ${cartLocator}[order]
    