*** Settings ***
Documentation    Setup and teardown to execute every test run
Library    Browser

*** Variables ***
&{setupTeardown}    url=https://sut-test-adrian.squashcloud.io/
...    browser=firefox
${TEST SETUP}    Setup
${TEST TEARDOWN}    Teardown
*** Keywords ***
Setup
    New Browser    ${setupTeardown}[browser]    headless=false
    New Page    url=${setupTeardown}[url]
Teardown
    Browser.Close Browser