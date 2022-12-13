*** Settings ***
Library    Browser

*** Variables ***

*** Keywords ***
Choose cloth article
    [Arguments]    ${choice}
    Click    xpath=//a[.="${choice}"]
    
