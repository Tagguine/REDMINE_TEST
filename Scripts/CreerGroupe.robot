*** Settings ***
Documentation    Script to create a new Group
Library    SeleniumLibrary
Variables    ../Ressources/Locators/locators.py
Resource    ../Ressources/Keywords/Keywords.robot

*** Variables ***
${vURL}    http://localhost:8083
${vBrowser}    Chrome
${vUsername}    6402910
${vPassword}    6402910
${vGroupName}    6402910

*** Test Cases ***

Create Group
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    CreateGroup    ${vGroupName}
    LogOut





