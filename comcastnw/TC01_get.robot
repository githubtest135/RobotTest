*** Settings ***

Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  Collections


*** Variables ***
${baseurl}   https://reqres.in


*** Test Cases ***

Get_User
#    create session  mysession ${baseurl}

    Create Session   mysession    ${baseurl}
    ${payload}=  Create Dictionary   email=eve.holt@reqres.in     password=pistol
    ${responce}=     post on session  mysession   url=/api/register  data=${payload}


#
#
   log to console  ${responce}
#
#    ${Content-Type} Get From Dictionary  ${responce.headers}  Content-Type
#
#    Should Be Equal  ${Content-Type}  application/json; charset=utf-8

Login succesful
    Create Session   mysession    ${baseurl}
    ${payload}=  Create Dictionary   email=eve.holt@reqres.in     password=pistol
    ${responce}=     post on session  mysession   url=/api/login  data=${payload}
    log to console    ${responce.content}




