*** Settings ***
Library    SeleniumLibrary

Library    DataDriver    data1.xlsx    sheet_name=Sheet1
Library    openpyxl
Library    ExcelLibrary




*** Variables ***
${url}    https://admin-demo.nopcommerce.com/

*** Test Cases ***

datavalidate
    Create Webdriver   Chrome     executable_path=C:/Users/pawarsi/OneDrive - AMDOCS/Backup Folders/Documents/chromedriver.exe
    Go To    ${url}
    Maximize Browser Window
    #[Arguments]    ${Email}    ${Password}

    Clear Element Text   //input[@id='Email']

    set selenium implicit wait      10 seconds

    Input Text    //input[@id='Email']    ${Email}

    set selenium implicit wait       10 seconds


    Clear Element Text   //input[@id='Password']

    set selenium implicit wait       10 seconds
    Input Text    //input[@id='Password']   ${Password}
    set selenium implicit wait      10 seconds

     Log To Console    ${Email}
     Log To Console    ${Password}
    set selenium implicit wait      15 seconds
    Click Button    //button[@type='submit']






