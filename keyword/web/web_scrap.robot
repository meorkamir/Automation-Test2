*** Settings ***
Documentation       All keyword to get perform web scrapping

Library         ${EXECDIR}/libraries/WebScrapping.py



*** Keywords ***
special handle shopee popup
    run keyword and ignore error
    ...    run keywords
    ...    wait until element is visible    class:shopee-button-outline--primary-reverse    ${TIMEOUT}
    ...    AND    click element    class:shopee-button-outline--primary-reverse
    ...    AND    click element    class:shopee-popup__close-btn

search ${item} from web
    special handle shopee popup
    input text    ${test_data["searchBox_locator"]}    ${item}
    click element    ${test_data["searchBtn_locator"]}
    wait until element is visible     ${test_data["resultPageWaitElement"]}    ${TIMEOUT}

get produt name, price and url
    @{element} =    get webelements    ${test_data["searchResultGrouping"]}
    ${elem_len} =    get length    ${element}

    @{element_prd_name} =    get webelements    ${test_data["prdName_locator"]}
    @{element_prd_price} =    get webelements    ${test_data["prdPrice_locator"]}
    @{element_prd_url} =    get webelements    ${test_data["prdUrl_locator"]}
    FOR    ${i}    IN RANGE    0    10
        ${prd_name} =     get text    ${element_prd_name[${i}]}
#        ${prd_price} =    get text          ${element_prd_price[${i}]}
        ${prd_url} =     get element attribute      ${element_prd_url[${i}]}       href
        log to console    ${prd_name}
#        log to console    ${prd_price}
        log to console    ${prd_url}
    END