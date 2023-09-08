*** Settings ***
Library  SeleniumLibrary
Variables  ../../Resources/WEB/PageObject/TestData/TestData.py
Variables   ../../Resources/WEB/PageObject/Locators/Locators.py

*** Variables ***


*** Test Cases ***
Open Chrome Browser
    #options 
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    #introduce proxies
    
    #redirect traffic through proxy

    Call Method  ${options}  add_argument  --start-maximized
    Call Method  ${options}  add_argument  --disable-notifications

    Open Browser  ${Domain}  ${BrowserName}  options=${options}
    Maximize Browser Window
    
Login to the Portal
    #click on login button
    Click Element  xpath://a[contains(text(),'Login')]
    Wait Until Element Is Visible  id:inputEmail
    Input Text  id:inputEmail  ${Email}
    Input Text  name:password    ${Password}
    Click Element   id:login
    #validate user is logged in
