*** Settings ***
Documentation       List övning
Library             SeleniumLibrary
Library             Collections
Library    XML
Suite Setup         setup

*** Variables ***
${url}               https://rahulshettyacademy.com/angularpractice/shop
@{actuallist}
@{expectedlist}     iphone X   Samsung Note 8    Nokia Edge    Blackberry

*** Test Cases ***
Test List
    Varify cards is in the shop page
    Get tests status



*** Keywords ***
setup
    Open Browser    browser=Chrome
    Go To           ${url}




Varify cards is in the shop page
    [Documentation]    List övnin
    @{elements}=       Get WebElements    css:.card-title

    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List      ${actuallist}    ${element.text}
    END
    Lists Should Be Equal    ${actuallist}    ${expectedlist}

Get tests status
    ${result}=    Run Keyword And Return Status    Lists Should Be Equal    ${actuallist}    ${expectedlist}
    Log    ${result}


    IF      ${result}== True
        Log    card is in the shop page
    ELSE
        Log    Error

    END
    
    

    
    

    


    
    




