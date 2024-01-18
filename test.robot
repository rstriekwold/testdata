*** Settings ***
Library               QWeb
Suite Setup           Open Browser             https://google.com    chrome
Suite Teardown        CloseAllBrowsers
Library               RPA.Tables
Library               RPA.Excel.Files
Library               Collections

# In this exercise we use the same salesforce scenario built with exercise 6 and 12.

*** Test Cases ***
Exercise 14 - Data Driven Testing - Create Lead using Suite Test Template with ${lead_status} ${last_name} ${company} ${first_name} ${salutation}
    Open workbook     test.xlsx
    ${worksheet}=     Read worksheet           header=${TRUE}
    ${table}=         Create table             ${worksheet}
    ${rows} =         Find table rows          ${table}              test1        ==    ${1}
    Log To Console    ${rows}
    @{export}=        Export table             ${rows}

    ${items} =        Get Dictionary items     @{export}
    @{keys} =         Get Dictionary keys      @{export}
    @{values} =       Get Dictionary values    @{export}
    
    ${counter}=       set variable             ${0}
    FOR               ${key}                   IN                    @{keys}
        log to console                         ${key}
 
        Set Suite Variable                     ${${key}}             ${values}[${counter}]
        Log To console              CHECK: ${test1} 
        Log To console              CHECK: ${test2} 
        ${counter}                  evaluate                     ${counter}+1   
    END

test cases 2
    log to console    ${test1}
    log to console    ${test2}






