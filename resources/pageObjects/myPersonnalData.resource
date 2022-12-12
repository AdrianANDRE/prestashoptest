*** Settings ***
Library    SeleniumLibrary
*** Variables ***
&{personnalDataLocator}    radiobuttonTitre=//div[@class="col-md-6 js-input-column form-control-valign"]
...    checkboxPartnerOffer=//input[@name="optin"]
...    buttonRegister=//button[@class="btn btn-primary form-control-submit float-xs-right"]
*** Keywords ***
