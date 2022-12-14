*** Settings ***
Library    Browser
*** Variables ***
&{homeLocator}    title=//h1/a[@href="https://sut-test-adrian.squashcloud.io/"]

*** Keywords ***
Check home page
    Get Element    ${homeLocator}[title]    #Check if the h1 title is the logo of the website , it's only h1 on the home page
