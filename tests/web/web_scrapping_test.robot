*** Settings ***
Resource     ${EXECDIR}/keyword/web/main.robot

Test Setup        user launch ${browser_type} browser : expected title ${title}
Test Teardown     user close browser

*** Test Cases ***
Test#1-- Able to launch web app based on test data file
    [Tags]      test1
    search iphone 11 from web
    get page source and process it

#Test#2-- Able to save data into excel
#    [Tags]      test2