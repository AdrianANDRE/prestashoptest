*** Settings ***
Library    Browser
*** Variables ***
&{homeLocator}    title=//h1/a[@href="https://sut-test-adrian.squashcloud.io/"]
...    connectbuttonHome=//span[.="Connexion"]
...    disconnectLinkHome=//a[@href="https://sut-test-adrian.squashcloud.io/?mylogout=" and @class="logout hidden-sm-down"]
*** Keywords ***
Check home page
    Get Element    ${homeLocator}[title]
Click button connexion home
    Click    ${homeLocator}[connectbuttonHome]

Check name home
    [Arguments]    ${name}    ${lastname}
    TRY
        Get Element    //input[.="${name} ${lastname}"]

    EXCEPT
        Log    votre WebElement n'existe pas mais j'ai une solution pour vous   level=INFO 
        
    END
    Get Element    //span[.="${name} ${lastname}"]