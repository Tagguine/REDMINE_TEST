*** Settings ***
Documentation    Scripts to test Create and Delete an Announcement in a project - Redmine
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

CreateAnnouncement
    [Arguments]    ${vURL}    ${vProject}    ${vTitle}    ${vSummary}    ${vDescription}
    Go To    ${vURL}/projects/${vProject}
    Click Element    ${link_News}
    Click Element    ${link_NewAnnouncement}
    Input Text    ${input_AnnouncementTitle}    ${vTitle}
    Input Text    ${input_AnnouncementSummary}    ${vSummary}
    Input Text    ${input_AnnouncementDescription}    ${vDescription}
    Click Element    ${input_CreateAnnouncement}
    Wait Until Element Is Visible    ${message_Success}    5s
    Element Text Should Be    ${message_Success}    Création effectuée avec succès.

DeleteAnnouncement
    [Arguments]    ${vURL}    ${vProject}    ${vTitle}
    Go To    ${vURL}/projects/${vProject}
    Click Element    ${link_News}
    Click Link    ${vTitle}
    Click Element    ${link_DeleteAnnouncement}
    Handle Alert
    Wait Until Element Is Visible    ${message_Success}    5s
    Element Text Should Be    ${message_Success}    Suppression effectuée avec succès.

LogOut
    Click Element    ${link_Logout}
    Close Browser
