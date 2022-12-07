*** Settings ***
Documentation    Page object of the login page
Library    SeleniumLibrary

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
    Input Text    ${loginLocator}[emailField]    ${login}    clear=True
Set pwd
    [Arguments]    ${pwd}
    [Documentation]    It's used to input pwd and clear pwd field
    Input Text    ${loginLocator}[pwdField]    ${pwd}    clear=True
Check forgotPwdLink
    Element Should Be Visible    ${loginLocator}[forgotPwdLink]
Check no accountLink
    Element Should Be Visible    ${loginLocator}[noAccountLink]
Click button Connexion
    Click Button    ${loginLocator}[buttonConnexion]

