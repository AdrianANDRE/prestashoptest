*** Settings ***
Library    Browser
Library    String

*** Keywords ***
Convert price to number
    [Documentation]    This method convert a price to a number
    [Arguments]    ${element}
    ${price}    Get Text    ${element}
    ${nodevise}    Remove String Using Regexp    ${price}    ([^0-9.,])
    ${convert}    Replace String    ${nodevise}    ,    .        
    ${int}    Convert To Number    ${convert}
    [return]    ${int}
Convert number to price
    [Documentation]    This method change . to , and convert to string to be able to be in a xpath as a variable present on the SUT
    [Arguments]    ${price}
    ${stringprice}    Convert To String    ${price}
    ${result}    Replace String    ${stringprice}    .    ,
    [Return]    ${result}