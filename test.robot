*** Settings ***
Library               QWeb
Suite Setup           Open Browser                https://google.com    chrome
Suite Teardown        CloseAllBrowsers
Library               RPA.Tables
Library               RPA.Excel.Files
Library               Collections

# In this exercise we use the same salesforce scenario built with exercise 6 and 12.

*** Test Cases ***
Exercise 14 - Data Driven Testing - Create Lead using Suite Test Template with ${lead_status} ${last_name} ${company} ${first_name} ${salutation}
    Open workbook     test.xlsx
    ${worksheet}=     Read worksheet              header=${TRUE}
    ${table}=         Create table                ${worksheet}
    ${rows} =         Find table rows             ${table}              test1     ==                 ${1}
    Log To Console    ${rows}
    # ${first}=         RPA.Tables.Get table row    ${rows}               -1        as_list=${TRUE}
    @{export}=       Export table    ${rows}                        as_list=True
    
    Filter table by column    ${table}    test1     ==                        ${1}
    FOR    ${i}    IN    @{table}
        Log to console   ${i}
    END




    FOR    ${i}    IN    @{export}
        Log to console    ${i}
    END




