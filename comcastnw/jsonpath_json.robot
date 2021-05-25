#java script object notation
#it is Nohing bu the format
#json  path we use to get The exact loaction

*** Settings ***
Library  JSONLibrary
Library  OS
Library  Collections


*** Test Cases ***
Testcase1
    ${json_obj}  load json from file     json_validation.json
    ${Fname}     get value from json     ${json_obj}     $.firstName
    log to console  ${Fname}
    BuiltIn.Should Be Equal  ${Fname[0]}    John





