*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Navigate On Page With Link
    [Arguments]    ${link_name}
    Click Link    ${link_name}
    Wait Until Page Contains   