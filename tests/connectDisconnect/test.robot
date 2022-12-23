*** Settings ***
Resource    ../../resources/pageObjects/article.resource
Resource    ../../resources/stepDefinition/steplogin.resource
Resource    ../../resources/setupTeardown.resource
Resource    ../../resources/pageObjects/header.resource
Resource    ../../resources/stepDefinition/cartManagment.resource
Resource    ../../resources/stepDefinition/orderManagment.resource
Test Setup    ${TEST 8 TEARDOWN}
Test Teardown    Teardown

*** Variables ***
${alias}    alias
${company}    company
${tva}    trop
${adress}    1 rue du test
${supp}    test pour savoir si ça fonctionne
${zip}    94110
${city}    Arcueil
${country}    France
${phone}    0616061606
${paymode}    Click and collect
*** Test Cases ***
Testing
    [Setup]    ${TEST SETUP}
    i'm log as user : "coucou"
	i add "2" random articles in the cart
	There is those "2" articles in the cart with the correct total price
	i initiate placing order process
	I fill command form with alias ${alias} company ${company} tva ${tva} address ${adress} supp ${supp} zip ${zip} city ${city} country ${country} phone ${phone} and facturation "check" and submit
	Take Screenshot
    i choose delivery "Click and collect"
    Take Screenshot    delivery
	i pay by paymode ${paymode} and choose approveSalesConditions "check"
    Take Screenshot    payment
	i submit order
    Take Screenshot    confirmation
	i have a confirmation message on my order
    Teardown 8
    Teardown