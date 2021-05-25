*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  JSONLibrary
Library  OS
Resource     test_properties.txt
Suite Setup                Set Log Level    debug
Library    DataDriver    file=my_data_source.xlsx    sheet_name=Sheet1
*** Test Cases ***

Test title
    ${responce}=     Api Get  ${base_url}
    log to console   ${responce}
    log  ${responce}

*** Keywords ***
Api Get
    [Arguments]     ${Appbaseurl}
    ${proxies}   create dictionary     http=https:genproxy.amdocs.com:8080    https=http:genproxy.amdocs.com:8080
    create session   mysession   ${Appbaseurl}      proxies=${proxies}
    ${responce}=     get request     mysession   /rest/v2/alpha/IN
    [Return]     ${responce.content}
