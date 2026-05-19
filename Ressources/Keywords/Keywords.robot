*** Settings ***
Documentation    Scripts to test create a new group AND create a new request status - Redmine
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

CreateRequestStatus
    [Arguments]    ${vStatusName}    ${vDescriptionName}
    Click Element    ${link_Administration}
    Title Should Be    Administration - Redmine
    Click Element    ${link_RequestStatus}
    Title Should Be    Statuts de demandes - Redmine
    Click Element    ${link_NewStatus}
    Title Should Be    Nouveau statut - Statuts de demandes - Redmine
    Input Text    ${input_StatusName}    ${vStatusName}
    Input Text    ${input_DescriptionName}    ${vDescriptionName}
    Click Element    ${input_CreateStatus}
    Wait Until Element Is Visible    ${message_Success}    5s
    Element Text Should Be    ${message_Success}    Création effectuée avec succès.

LogOut
    Click Element    ${link_Logout}
    Close Browser

    