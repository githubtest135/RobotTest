*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  JSONLibrary
Library  OS

*** Variables ***
${base_url}  https://restcountries.eu

${proxy_port}    8080
*** Test Cases ***
get_countries_name
    ${proxies}   create dictionary     http=https:genproxy.amdocs.com:8080    https=http:genproxy.amdocs.com:8080
    create session   mysession   ${base_url}     #proxies=${proxies}
    ${responce}=     get request     mysession   /rest/v2/alpha/IN
    log to console   ${responce.content}
    SHOULD BE EQUAL AS STRINGS    ${responce.status_code}    200
    ${json_obj}=     set variable     ${responce.json()}
    log to console    jsosn:${json_obj}

    ${file}=     ${CURDIR}/Data.xlsx
    log to console   ${file}

#    ${name}=    get value from json  ${json_obj}
#
#       log to console   ${name[0]}
#       should be equal  ${name[0]}   michael.lawson@reqres.in

#
#
#    ${borders}=  get value from json  ${json_obj}     $.borders
#    should contain   ${borders[0]}  AFG
#    should contain   ${borders[0]}  AFG



