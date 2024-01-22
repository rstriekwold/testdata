*** Settings ***


Library                   QWeb
Suite Setup               Open Browser    https://copado.com    chrome
Suite Teardown            CloseAllBrowsers
Library                   Collections
# Library    Process

*** Test Cases ***
Testcase 01
    Load data line        file=${CURDIR}/testdata1.xlsx                            sheet_name=Sheet1    testcaseName=tc01
    Log To console        Testcasename          : ${testcasename}
    Log To console        Lastname: ${lastname}
    Log To console        Firstname: ${firstname}
    Log To console        Company: ${company}
    Log To console        Email: ${email}

test cases 2
    Load data line        file=${CURDIR}/testdata1.xlsx                            sheet_name=Sheet1    testcaseName=tc02
    Log To console        Testcasename: ${testcasename}
    Log To console        Lastname: ${lastname}
    Log To console        Firstname: ${firstname}
    Log To console        Company: ${company}
    Log To console        Email: ${email}

test cases 3
    Load data line        file=${CURDIR}/testdata1.xlsx                            sheet_name=Sheet1    testcaseName=tc03
    Log To console        Testcasename: ${testcasename}
    Log To console        Lastname: ${lastname}
    Log To console        Firstname: ${firstname}
    Log To console        Company: ${company}
    Log To console        Email: ${email}



*** Keywords ***
Load data line
    [Arguments]           ${file}                     ${sheet_name}               ${testcaseName}
    Open workbook         ${file}
    ${worksheet}=         Read worksheet              ${sheet_name}               header=${TRUE}
    ${table}=             Create table                ${worksheet}
    ${rows} =             Find table rows             ${table}                    testcasename         ==              ${testcaseName}

    @{export}=            Export table                ${rows}
    &{dict}=              Convert To Dictionary       @{export}

    FOR                   ${key_value_tuple}          IN                          &{dict}

        Set Suite Variable                            ${${key_value_tuple}[0]}    ${key_value_tuple}[1]

    END

install Library
    ${result}=            Run Process                 pip install rpaframework    alias=manager        shell=True
    import Library        RPA.Tables
    import Library        RPA.Excel.Files