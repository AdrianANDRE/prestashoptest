*** Settings ***
Documentation    Setup and teardown to execute every test run
Library    Browser
Resource    pageObjects/header.resource
Resource    pageObjects/account.resource

*** Variables ***
&{setupTeardown}    url=https://sut-test-adrian.squashcloud.io/
...    browser=firefox    
${TEST SETUP}    Setup
${TEST TEARDOWN}    Teardown
*** Keywords ***
Setup
    New Browser    ${setupTeardown}[browser]    headless=false
    New Context    locale=-FR
    New Page    url=${setupTeardown}[url]
Teardown
    Go to account
    Delete adress
    Browser.Close Browser
Teardown 8
    Go to account
    Delete adress