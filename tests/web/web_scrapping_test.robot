*** Settings ***
Resource     ${EXECDIR}/keyword/web/main.robot

Suite Setup        user launch ${browser_type} browser
Suite Teardown     user close browser

*** Test Cases ***
Test#1-- Search product info from Lazada
    [Tags]      testLazada
    ${test_data}=    create dictionary
    ...    url=https://www.lazada.com.my                                                           #provide URL web to be test
    ...    pageTitle=Lazada                                                                        #provide expected page title
    ...    searchItem=iphone 11                                                                    #search word to be use
    ...    searchBox_locator=id:q                                                                  #locator for search box
    ...    searchBtn_locator=//button[@class="search-box__button--1oH7"]                           #locator for search btn
    ...    resultPageWaitElement=//*[@data-tracking="product-card"]                                #locator to wait search result page loaded
    ...    searchResultGrouping=//*[@data-qa-locator="product-item"]                               #locator to get number of search result
    ...    prdName_locator=//div[@class="c16H9d"]/a                                                #locator to get product name
    ...    prdPrice_locator=//*[@data-tracking="product-card"]//following::span[@class="c13VH6"]   #locator to get product price
    ...    prdUrl_locator=//*[@data-tracking="product-card"]//a                                    #lcoator to get product URL
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
    ...    resultPageWaitElement=//*[@data-sqe="item"]
    ...    searchResultGrouping=//*[@data-sqe="name"]/div[1]
    ...    prdName_locator=//*[@data-sqe="name"]/div[1]
    ...    prdPrice_locator=//*[@class="_1w9jLI _37ge-4 _2ZYSiu"]//span[2]
    ...    prdUrl_locator=//*[@data-sqe="item"]//a
    set test variable    &{test_data}
    wait until page loaded: page ${test_data["pageTitle"]}
    search ${test_data["searchItem"]} from web
    get produt name, price and url

Test#3-- Process raw data from file
    [Tags]      testProcess
    process result from raw data