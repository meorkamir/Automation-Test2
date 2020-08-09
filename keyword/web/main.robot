*** Settings ***
Documentation       Main file with reusable code to run web application

Library         SeleniumLibrary

Resource        ${EXECDIR}/keyword/web/web_scrap.robot
Library         ${EXECDIR}${/}libraries/FileHandling.py

*** Variables ***
${TIMEOUT}    20s

*** Keywords ***
user launch ${browser_type} browser
    open browser   https://www.google.com     ${browser_type}
    maximize browser window

wait until page loaded: page ${title}
    go to    ${test_data["url"]}
    wait until keyword succeeds    ${TIMEOUT}    2s
    ...    page should contain    ${title}

user close browser
    close browser