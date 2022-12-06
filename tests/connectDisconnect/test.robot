*** Settings ***
Resource    squash_resources.resource
*** Test Cases ***
Testing
    Setup
    Check home page
    Click button connexion home
    Set email    toto@aol.com
    Set pwd    8QAgcu6bIbfrIknFx6UzaRBCIpGpcncV
    Check forgotPwdLink
    Check no accountLink
    Click button Connexion
    Close Browser
    