*** Settings ***
Documentation    Script to test Create a new Request Status - Redmine
Library    SeleniumLibrary
Variables    ../Ressources/Locators/locators.py
Resource    ../Ressources/Keywords/Keywords.robot

*** Variables ***
${vURL}    http://localhost:8083
${vBrowser}    Chrome
${vUsername}    6402910
${vPassword}    6402910
${vStatusName}    6402910
${vDescriptionName}    Examen intra    

*** Test Cases ***

Create Request Status
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    CreateRequestStatus    ${vStatusName}    ${vDescriptionName}
    LogOut





