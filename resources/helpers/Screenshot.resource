*** Settings ***
Library    Browser
Library    RPA.Browser
*** Keywords ***
Take screenshot custom
    [Arguments]    ${namescreenshot}
    Screenshot    filename=logScreenshot/${namescreenshot}.jpg
