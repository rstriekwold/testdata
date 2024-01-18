# *** Settings ***
# Library                   QWeb
# Suite Setup               Open Browser                https://google.com       chrome
# Suite Teardown            CloseAllBrowsers
# Library                   RPA.Tables
# Library                   RPA.Excel.Files
# Library                   Collections



# *** Test Cases ***
# Testcase 01
#     Load data line        file=${CURDIR}/testdata.xlsx          sheet_name=Sheet1        testcaseName=tc01
#     Log To console        Testcasename: ${testcasename}
#     Log To console        Lastname: ${lastname}
#     Log To console        Firstname: ${firstname}
#     Log To console        Company: ${company}
#     Log To console        Email: ${email}

# test cases 2
#     Load data line        file=${CURDIR}testdata.xlsx          sheet_name=Sheet1        testcaseName=tc02
#     Log To console        Testcasename: ${testcasename}
#     Log To console        Lastname: ${lastname}
#     Log To console        Firstname: ${firstname}
#     Log To console        Company: ${company}
#     Log To console        Email: ${email}

# test cases 3
#     Load data line        file=${CURDIR}testdata.xlsx          sheet_name=Sheet1        testcaseName=tc03
#     Log To console        Testcasename: ${testcasename}
#     Log To console        Lastname: ${lastname}
#     Log To console        Firstname: ${firstname}
#     Log To console        Company: ${company}
#     Log To console        Email: ${email}



# *** Keywords ***
# Load data line
#     [Arguments]           ${file}                     ${sheet_name}            ${testcaseName}
#     Open workbook         ${CURDIR}/testdata.xlsx 
#     ${worksheet}=         Read worksheet              Sheet1           header=${TRUE}
#     ${table}=             Create table                ${worksheet}
#     ${rows} =             Find table rows             ${table}                 testcasename         ==    tc01

#     @{export}=            Export table                ${rows}
#     &{dict}=              Convert To Dictionary                    @{export}
#     @{keys} =             Get Dictionary keys         @{export}
#     @{values} =           Get Dictionary values       @{export}

#     ${counter}=           set variable                ${0}
#     FOR                   ${key}                      IN                       @{keys}
#         log to console    ${key}
        
#         Set Suite Variable                            ${${key}}                ${values}[${counter}]

#         ${counter}        evaluate                    ${counter}+1
#     END

#     FOR    ${key_value_tuple}    IN    &{dict}
#         Log to console  VALUE: ${key_value_tuple}
#         Set Suite Variable     ${${key_value_tuple}[0]}                          ${key_value_tuple}[1]
        
#         # ('string', 'cat'), ('number', 1), ('list', ['one', 'two', 'three'])
#     END
#     Log To console        Testcasename: ${testcasename}
#     Log To console        Lastname: ${lastname}
#     Log To console        Firstname: ${firstname}
#     Log To console        Company: ${company}
#     Log To console        Email: ${email}
 