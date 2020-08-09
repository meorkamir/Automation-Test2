*** Settings ***
Resource     ${EXECDIR}/keyword/web/main.robot

Test Setup        user launch ${browser_type} browser
Test Teardown     user close browser

*** Test Cases ***
Test#1-- Search product info from Lazada
    [Tags]      testLazada
    ${test_data}=    create dictionary
    ...    url=https://www.lazada.com.my
    ...    pageTitle=Lazada
    ...    searchItem=iphone 11
    ...    searchBox_locator=id:q
    ...    searchBtn_locator=//button[@class="search-box__button--1oH7"]
    ...    resultPageWaitElement=//*[@data-tracking="product-card"]
    ...    searchResultGrouping=//*[@data-qa-locator="product-item"]
    ...    prdName_locator=//div[@class="c16H9d"]/a
    ...    prdPrice_locator=//*[@data-tracking="product-card"]//following::span[@class="c13VH6"]
    ...    prdUrl_locator=//*[@data-tracking="product-card"]//a
    set test variable    &{test_data}
    wait until page loaded: page ${test_data["pageTitle"]}
    search ${test_data["searchItem"]} from web
    get produt name, price and url

Test#2-- Search product info from Shoppee
    [Tags]      testShopee
    ${test_data}=    create dictionary
    ...    url=https://www.shopee.com.my
    ...    pageTitle=Shopee
    ...    searchItem=iphone 11
    ...    searchBox_locator=class:shopee-searchbar-input__input
    ...    searchBtn_locator=//*[@class="shopee-searchbar__main"]/following-sibling::button
    ...    resultPageWaitElement=class:shopee-search-item-result__items
    ...    searchResultGrouping=//*[@data-sqe="item"]
    ...    prdName_locator=//*[@data-sqe="name"]/div
    ...    prdPrice_locator=//*[@data-tracking="product-card"]//following::span[@class="c13VH6"]
    ...    prdUrl_locator=//*[@data-sqe="item"]//a
    set test variable    &{test_data}
    wait until page loaded: page ${test_data["pageTitle"]}
    search ${test_data["searchItem"]} from web
    get produt name, price and url