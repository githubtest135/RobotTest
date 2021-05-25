*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  Collections
Library  JSONLibrary
Library  XML

*** Test Cases ***
TestCase1

    ${xml_obj}=   parse xml   xml_validator.xml
    log to console   ${xml_obj}

#    ${fname}=     get element text    ${xml_obj}  .//employee[@id="be129"]/firstname
#    log to console   ${fname}
#    should be equal  ${fname}     Jane



#   ${get_element_text}=  get element    ${xml_obj}   .//employee[@id="be129"]/firstname
#   log to console    ${get_element_text}
#   should be equal  ${get_element_text.text}    Jane

#   element text should be   ${xml_obj}   Jane   .//employee[@id="be129"]/firstname
#     get number of elements Count
#
    ${count}=    get element count   ${xml_obj}   .//employee[@id="be129"]
    log to console   ${count}

# chck attribute prsence

    element attribute should match   ${xml_obj}  id  be129   .//employee[1]

## how can we Get the all element in one Node
   ${child_element}=    get child elements   ${xml_obj}   .//employee[1]

   log to console    ${child_element}
   ${child_count}    get length  ${child_element}
   log to console   ${child_count}


   FOR  ${i}     IN RANGE    0   ${child_count}
       log to console   ${child_element[${i}].text}

   END


