*** Settings ***
Documentation    Première suite de test avec un script de connexion
Library    SeleniumLibrary
Variables    ../Locators/locators.py


*** Variables ***
${vTIMEOUT}    5

*** Keywords ***
Login
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Open Browser    ${vURL}/login    ${vBrowser}
    Maximize Browser Window
    Input Text    ${input_Username}    ${vUsername}
    Input Text    ${input_Password}    ${vPassword}
    Click Element    ${input_Submit}    
    Wait Until Page Contains    Ma page - Redmine    5s
    Element Text Should Be    ${link_Username}    ${vUsername}

CreateGroup
    [Arguments]    ${vGroupName}
    Click Element    ${link_Administration}
    Title Should Be    Administration - Redmine
    Click Element    ${link_Groups}
    Title Should Be    Groupes - Redmine
    Click Element    ${link_NewGroup}
    Title Should Be    Nouveau groupe - Groupes - Redmine
    Input Text    ${input_GroupName}    ${vGroupName}
    Click Element    ${input_CreateGroup}
    Wait Until Element Is Visible    ${message_Success}    5s
    Element Text Should Be    ${message_Success}    Création effectuée avec succès.

LogOut
    Click Element    ${link_Logout}
    Close Browser

    