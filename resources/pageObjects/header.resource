*** Settings ***
Documentation    Header of all html page
Library    Browser
Library    String
Library    Collections
Resource    ../helpers/convertprice.resource

*** Variables ***
&{headerLocator}    cartbutton=//span[.="Panier"]
...    login=//span[.="Connexion"]
...    logout=//a[@href="https://sut-test-adrian.squashcloud.io/?mylogout=" and @class="logout hidden-sm-down"]
...    homebutton=//div[@id="_desktop_logo"]
...    buttonClothes=//a[@href="https://sut-test-adrian.squashcloud.io/3-vetements"]
...    price=//div[@class="col-md-6 col-xs-2 price"]
...    accountbutton=//a[@class="account"]//span

*** Keywords ***
Login
    Click    ${headerLocator}[login]    
Logout
    Click    ${headerLocator}[logout]    
Check name
    [Arguments]    ${name}    ${lastname}
    Wait For Elements State    xpath=//span[.="${name} ${lastname}"]    visible
    Get Element    xpath=//span[.="${name} ${lastname}"]    #To check if your connected to the right account
Go to account
    Wait For Elements State    ${headerLocator}[accountbutton]    visible
    Click    ${headerLocator}[accountbutton]     #To go to the account page
Go to clothes
    Wait For Elements State    ${headerLocator}[buttonClothes]    visible
    Click    ${headerLocator}[buttonClothes]    
Return home
    Wait For Elements State    ${headerLocator}[homebutton]    visible
    Click    ${headerLocator}[homebutton]
Go to cart
    Wait For Elements State    ${headerLocator}[cartbutton]    visible
    Click    ${headerLocator}[cartbutton]

Check price cart
    ${totalprice}    Set Variable    0
    @{webelement}    Get Elements    ${headerLocator}[price]
    @{listprice}    Create List    
    FOR    ${element}    IN    @{webelement}
    ${int}    Convert price to number    ${element}
    Append To List    ${listprice}    ${int}
    END
    FOR    ${price}    IN    @{listprice}
    ${totalprice}    Evaluate    round(${price}+${totalprice},2)
    END
    ${totalpricestring}    Convert number to price    ${totalprice}
    Get Element    xpath=//div[@id="cart-subtotal-products"]//span[contains(text(),"${totalpricestring}")]    #check the total price directly in the xpath