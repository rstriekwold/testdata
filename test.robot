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
    ${rows} =         Find table rows          ${table}              test1      ==    ${1}
    Log To Console    ${rows}
    @{export}=        Export table             ${rows}
    ${items} =        Get Dictionary items     @{export}
    ${keys} =         Get Dictionary keys      @{export}
    ${values} =       Get Dictionary values    @{export}

    # FOR             ${i}                     IN                    @{export}
    #                 Log to console           ${i}
    # END

    FOR               ${key}                   IN                    @{dict}
        Log to console                         ${dict}${key}         # value1
    END




