*** Settings ***
Documentation    Setup and teardown to execute every test run
Library    SeleniumLibrary

*** Variables ***
&{setupTeardown}    url=https://sut-test-adrian.squashcloud.io/
...    browser=Firefox
${TEST SETUP}    Setup
${TEST TEARDOWN}    Teardown
*** Keywords ***
Setup
    Set Selenium Implicit Wait    2 seconds
    Set Screenshot Directory    logScreenshot
    Open Browser    browser=${setupTeardown}[browser]    executable_path=driver\geckodriver.exe    service_log_path=${{os.path.devnull}}
    Go To    ${setupTeardown}[url]
    Maximize Browser Window
Teardown
    Close Browser