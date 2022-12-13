*** Settings ***
Library    Browser
*** Variables ***
&{articleLocator}   addtocart=//button[@class="btn btn-primary add-to-cart"] 
...    continuemyshop=//button[@class="btn btn-secondary"]

*** Keywords ***
Add to cart
    Click    ${articleLocator}[addtocart]
    Click    ${articleLocator}[continuemyshop]

Check the right article
    [Arguments]    ${choice}
    Get Element    //h1[contains(text(),"${choice}")]