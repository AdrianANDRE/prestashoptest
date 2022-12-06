*** Settings ***
Library    SeleniumLibrary
*** Variables ***
&{homeLocator}    title=//h1/a[@href="https://sut-test-adrian.squashcloud.io/"]
...    connectbuttonHome=//span[.="Connexion"]
...    disconnectLinkHome=//a[@href="https://sut-test-adrian.squashcloud.io/?mylogout=" and @class="logout hidden-sm-down"]
*** Keywords ***
Check home page
    Element Should Be Visible    ${homeLocator}[title]
Click button connexion home
    Click Element    ${homeLocator}[connectbuttonHome]

Check name home
    [Arguments]    ${name}    ${lastname}
    TRY
        Element Should Be Visible    //input[.="${name} ${lastname}"]

    EXCEPT
        Log    votre WebElement n'existe pas mais j'ai une solution pour vous   level=INFO 
        
    END
    Element Should Be Visible    //span[.="${name} ${lastname}"]
    