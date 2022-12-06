*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Take screenshot custom
    [Arguments]    ${namescreenshot}
    Capture Page Screenshot    filename=logScreenshot/${namescreenshot}.jpg
