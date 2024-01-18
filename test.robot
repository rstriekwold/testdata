*** Settings ***
Library               QWeb
Suite Setup           Open Browser             https://google.com    chrome
Suite Teardown        CloseAllBrowsers
Library               RPA.Tables
Library               RPA.Excel.Files
Library               Collections



*** Test Cases ***
Testcase 01
    Open workbook     testdata.xlsx
    ${worksheet}=     Read worksheet           header=${TRUE}
    ${table}=         Create table             ${worksheet}
    ${rows} =         Find table rows          ${table}              testcasename        ==    tc01
    Log To Console    ${rows}
    @{export}=        Export table             ${rows}

    @{keys} =         Get Dictionary keys      @{export}
    @{values} =       Get Dictionary values    @{export}
    
    ${counter}=       set variable             ${0}
    FOR               ${key}                   IN                    @{keys}
        log to console                         ${key}
 
        Set Suite Variable                     ${${key}}             ${values}[${counter}]

        ${counter}                  evaluate                     ${counter}+1   
    END
        Log To console              Testcasename: ${testcasename} 
        Log To console              Lastname: ${lastname} 
        Log To console              Firstname: ${firstname} 
        Log To console              Company: ${company} 
        Log To console              Email: ${email} 

test cases 2
        Log To console              Testcasename: ${testcasename} 
        Log To console              Lastname: ${lastname} 
        Log To console              Firstname: ${firstname} 
        Log To console              Company: ${company} 
        Log To console              Email: ${email} 





