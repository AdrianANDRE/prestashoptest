*** Settings ***
Library    Browser
*** Keywords ***
Take screenshot custom
    [Arguments]    ${namescreenshot}
    Take Screenshot    filename=logScreenshot/${namescreenshot}.jpg
