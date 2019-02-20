#Login and logout keywords

*** Settings ***
Documentation    Tests relating login and logout
Library    SeleniumLibrary
Suite Setup    Open Browser    url=https://www.ultimateqa.com/    browser=chrome    remote_url=http://172.17.0.3:4445/wd/hub
Suite Teardown    Close Browser


*** Variables ***
${Email_address}    testi@esimerkki.com
${password}    'huippu salainen salasana'

*** Keywords ***
Navigate To Page With Link
    [Arguments]    ${link_name}
    Click Link    partial link:${link_name}
    Wait Until Page Contains    ${link_name}

Enter Credentials
    [Arguments]    ${email}    ${psswrd}
    Input Text    id=user_email   ${email}
    Input Text    id=user_password   ${psswrd}  

Start Creating New Account
    Click Link    '/users/sign_up'

*** Test Cases ***

Successful Login
    Maximize Browser Window
    Wait Until Page Contains    View All Course
    Navigate To Page With Link    Course
    Navigate To Page With Link    Sign
    Enter Credentials    ${Email_address}    ${password}
    Click Button    id=btn-signin
    Page Should Contain    Invalid
    Sleep    5

Failing Test
    Maximize Browser Window
    Wait Until Page Contains    View All Course
    Navigate To Page With Link    Course
    Navigate To Page With Link    Sign
    Enter Credentials    ${Email_address}    ${password}
    Click Button    id=btn-signin
    Page Should Contain    ONNISTUMINEN
    Sleep    5