*** Settings ***
Documentation    Scripts to test create a new group AND create a new request status - Redmine
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





