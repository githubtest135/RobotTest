*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  Collections

*** Variables ***
${baseurl}  https://reqres.in
*** Test Cases ***
Create_User
    create session  mysession   ${baseurl}

    ${payload}=  create dictionary   name=ABC   job=leader
#    ${header}=  create dictionary   content-type=application/json


    ${responce}=    patch request   mysession   /api/users  data=${payload}

    log to console  ${responce.status_code}
    log to console  ${responce.content}

    ${string_responce}=     convert to string   ${responce.content}
    should not be empty  ${string_responce}  updatedAt