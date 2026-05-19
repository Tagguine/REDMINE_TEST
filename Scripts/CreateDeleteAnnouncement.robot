*** Settings ***
Documentation    Script to test Create and Delete an Announcement in a project - Redmine
Library    SeleniumLibrary
Variables    ../Ressources/Locators/locators.py
Resource    ../Ressources/Keywords/Keywords.robot

*** Variables ***
${vURL}             http://localhost:8083
${vBrowser}         Chrome
${vUsername}        6402910
${vPassword}        6402910
${vProject}         6402910
${vTitle}           6402910
${vSummary}         Examen intra
${vDescription}     Examen intra

*** Test Cases ***

Create And Delete Announcement
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    CreateAnnouncement    ${vURL}    ${vProject}    ${vTitle}    ${vSummary}    ${vDescription}
    DeleteAnnouncement    ${vURL}    ${vProject}    ${vTitle}
    LogOut
