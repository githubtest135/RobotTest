*** Settings ***
Documentation    Suite description

*** Test Cases ***
forLoop
    : for  ${i}  IN  1  10  12
    \   log to console   ${i}

for loop in range
    : for    ${i}  IN RANGE  1   10
    \    log to console     ${i}

for loop in list
    @{Item}=     Create List     1   2   12
    for  ${i}    IN    @{Item}
        log to console   ${i}
    END