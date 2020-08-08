*** Settings ***
Documentation       All keyword to get perform web scrapping

Library         ${EXECDIR}/libraries/WebScrapping.py



*** Keywords ***
search ${item} from web
    input text    id:q    ${item}
    click element    //button[@class="search-box__button--1oH7"]
    wait until element is visible     //*[@data-qa-locator="product-item"]

get page source and process it
    ${page_source} =    get source
    web scrap    ${page_source}