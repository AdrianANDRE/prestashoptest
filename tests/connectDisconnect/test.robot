*** Settings ***
Resource    ../../resources/pageObjects/article.resource
Resource    ../../resources/stepDefinition/steplogin.resource
Resource    ../../resources/setupTeardown.resource
Resource    ../../resources/pageObjects/header.resource

*** Test Cases ***
Testing
    Setup
    i add "2" random articles in the cart
    Go to cart
    Check price cart