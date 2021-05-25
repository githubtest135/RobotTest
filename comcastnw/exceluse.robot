*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  JSONLibrary
Library  OS
# CSv file wil be same all methods are also will be same
Suite Setup                Set Log Level    debug
Library    DataDriver    file=${CURDIR}/Data.xlsx   sheet_name=Sheet1

Test Template    Api Get
*** Variable ***

*** Test Cases ***

Api get ${Base_URL}

*** Keywords ***
Api Get
    [Arguments]    ${Base_URL}
    ${proxies}   create dictionary     http=https:genproxy.amdocs.com:8080    https=http:genproxy.amdocs.com:8080
    create session   mysession   ${Base_URL}      #proxies=${proxies}
    ${responce}=     get request     mysession   /rest/v2/alpha/IN
    log to console   ${responce.content}
    log  ${responce}
    log to console   ${CURDIR}/Data.xlsx