*** Settings ***
Library    Browser
Library    RPA.Browser
*** Keywords ***
Take screenshot custom
    [Arguments]    ${namescreenshot}
    Take Screenshot    filename=logScreenshot/${namescreenshot}.jpg
