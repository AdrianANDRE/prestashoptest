*** Settings ***
Resource    ../../resources/pageObjects/header.resource
Resource    ../pageObjects/cart.resource
Resource    ../pageObjects/order.resource

*** Keywords ***
i initiate placing order process
    Go to order
I fill command form with alias ${alias} company ${company} tva ${tva} address ${adress} supp ${supp} zip ${zip} city ${city} country ${country} phone ${phone} and facturation "check" and submit
    Order adress form    ${adress}    ${zip}    ${city}    ${phone}    ${supp}    ${tva}    ${company}    ${alias}    ${country}

i choose delivery "Click and collect"
    Order delivery form
i pay by paymode ${paymode} and choose approveSalesConditions "check"
    Order payment form
i submit order
    Order button
i have a confirmation message on my order
    Check order confirmation    Transfert bancaire    Click and collect