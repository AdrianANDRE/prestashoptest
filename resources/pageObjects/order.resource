*** Settings ***
Documentation    This page contains all form when you continue your order by the cart page
Library    Browser

*** Variables ***
#Locator
&{orderLocator}    personnalInformationContent=//section[@id="checkout-personal-information-step"]//div[@class="content"]
...    adressfield=//input[@id="field-address1"]
...    cpfield=//input[@id="field-postcode"]
...    cityfield=//input[@id="field-city"]
...    checkboxbilling=//input[@id="use_same_address"]
...    adresscontinue=//button[@name="confirm-addresses"]
...    clickandcollect=//input[@id="delivery_option_1"]
...    deliverycontinue=//button[@name="confirmDeliveryOption"]
...    paymentbanktransfer=//input[@id="payment-option-3"]
...    checkboxconditionsale=//input[@id="conditions_to_approve[terms-and-conditions]"]
...    orderbutton=//button[contains(text(),"Commander")]
...    orderconfirmationtitle=//h3[@class="h1 card-title"]
...    aliasfield=//input[@id="field-alias"]
...    companyfield=//input[@id="field-company"]
...    TVAfield=//input[@id="field-vat_number"]
...    adress2field=//input[@id="field-address2"]
...    phonefield=//input[@id="field-phone"]
...    countryselect=//select[@id="field-id_country"]
#Dictionnary of choice


*** Keywords ***
Order adress form
    [Arguments]    ${adress}    ${cp}    ${city}    ${phone}    ${adress2}    ${tva}    ${company}    ${alias}    ${country}
    Wait For Elements State    ${orderLocator}[adressfield]    visible
    Fill Text    ${orderLocator}[adressfield]    ${adress}
    Fill Text    ${orderLocator}[cpfield]    ${cp}
    Fill Text    ${orderLocator}[cityfield]    ${city}
    Fill Text    ${orderLocator}[aliasfield]    ${alias}
    Fill Text    ${orderLocator}[companyfield]    ${company}
    Fill Text    ${orderLocator}[TVAfield]    ${tva}
    Fill Text    ${orderLocator}[adress2field]    ${adress2}
    Fill Text    ${orderLocator}[phonefield]    ${phone}
    Select Options By    ${orderLocator}[countryselect]    text    ${country}
    Check Checkbox    ${orderLocator}[checkboxbilling]
    Click    ${orderLocator}[adresscontinue]
Order delivery form
    Wait For Elements State    ${orderLocator}[clickandcollect]
    Check Checkbox    ${orderLocator}[clickandcollect]
    Click    ${orderLocator}[deliverycontinue]
Order payment form 
    Wait For Elements State    ${orderLocator}[paymentbanktransfer]
    Click    ${orderLocator}[paymentbanktransfer]
    Check Checkbox    ${orderLocator}[checkboxconditionsale]
Check order confirmation
    [Arguments]    ${payment}    ${delivery}
    Wait For Elements State    ${orderLocator}[orderconfirmationtitle]
    Get Element    xpath=//li[contains(text(),"${payment}")]
    Get Element    xpath=//li[contains(text(),"${delivery}")]
Order button
    Click    ${orderLocator}[orderbutton]
