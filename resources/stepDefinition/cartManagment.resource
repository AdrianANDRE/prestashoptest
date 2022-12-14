*** Settings ***
Resource    ../pageObjects/cart.resource
Resource    ../pageObjects/header.resource
Resource    ../pageObjects/clothes.resource
Resource    ../pageObjects/article.resource

*** Keywords ***
i add "2" random articles in the cart
    Go to clothes
    Choose cloth article     Pull imprimé colibri
    Add to cart
    Return home
    Go to clothes
    Choose cloth article    T-shirt imprimé colibri
    Add to cart
There is those "2" articles in the cart with the correct total price
    Go to cart
    Check cart article    Pull imprimé colibri
    Check cart article    T-shirt imprimé colibri
    Check price cart
