*** Settings ***
Library    Browser

*** Variables ***
&{accountLocator}    adressaccount=//a[@id="addresses-link"]
...    delete=//span[.="Supprimer"]
*** Keywords ***
Delete adress
    Wait For Elements State    ${accountLocator}[adressaccount]
    Click    ${accountLocator}[adressaccount]
    Click    ${accountLocator}[delete]