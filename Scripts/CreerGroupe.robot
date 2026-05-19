*** Settings ***
Documentation    Script qui permet de creer un nouveau Groupe
Library    SeleniumLibrary
Variables    ../Ressources/Locators/locators.py
Resource    ../Ressources/Keywords/Keywords.robot

*** Variables ***
${vURL}    http://localhost:8083
${vBrowser}    Chrome
${vUsername}    6402910
${vPassword}    6402910
${vNameGroupe}    6402910

*** Test Cases ***

Creer Groupe
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}   
    CreateGroupe    ${vNameGroupe}
    LogOut





