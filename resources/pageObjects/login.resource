*** Settings ***
Documentation    Page object of the login page
Library    Browser

*** Variables ***
&{loginLocator}    emailField=//input[@id="field-email"]
...    pwdField=//input[@id="field-password"]
...    forgotPwdLink=//a[@href="https://sut-test-adrian.squashcloud.io/recuperation-mot-de-passe"]
...    buttonConnexion=//button[@id="submit-login"]
...    noAccountLink=//a[@href="https://sut-test-adrian.squashcloud.io/index.php?controller=registration"]/parent::div[@class="no-account"]

*** Keywords ***
Set email
    [Arguments]    ${login}
    [Documentation]    It's used to input text and clear email field
    Fill Text    ${loginLocator}[emailField]    ${login}
Set pwd
    [Arguments]    ${pwd}
    [Documentation]    It's used to input pwd and clear pwd field
    Fill Text    ${loginLocator}[pwdField]    ${pwd}
Check forgotPwdLink
    Get Element    ${loginLocator}[forgotPwdLink]
Check no accountLink
    Get Element    ${loginLocator}[noAccountLink]
Click button Connexion
    Click    ${loginLocator}[buttonConnexion]

