*** Settings ***
Documentation       All keyword to get perform web scrapping

Library         ${EXECDIR}${/}libraries/FileHandling.py

*** Keywords ***
special handle shopee popup
    run keyword and ignore error
    ...    run keywords
    ...    wait until element is visible    class:shopee-button-outline--primary-reverse    ${TIMEOUT}
    ...    AND    click element    class:shopee-button-outline--primary-reverse
    ...    AND    wait until keyword succeeds    ${TIMEOUT}    2s     click element    class:shopee-popup__close-btn

search ${item} from web
    special handle shopee popup
    wait until keyword succeeds    ${TIMEOUT}    2s
    ...    input text    ${test_data["searchBox_locator"]}    ${item}
    click element    ${test_data["searchBtn_locator"]}
    wait until element is visible     ${test_data["resultPageWaitElement"]}    ${TIMEOUT}

get produt name, price and url
    @{element} =    get webelements    ${test_data["searchResultGrouping"]}
    ${elem_len} =    get length    ${element}

    @{element_prd_name} =    get webelements    ${test_data["prdName_locator"]}
    ${elem_name_len} =    get length    ${element_prd_name}
    @{element_prd_price} =    get webelements    ${test_data["prdPrice_locator"]}
    ${elem_prc_len} =    get length    ${element_prd_price}
    @{element_prd_url} =    get webelements    ${test_data["prdUrl_locator"]}
    ${elem_url_len} =    get length    ${element_prd_url}

    ${result}=    create list
    FOR    ${i}    IN RANGE    0    ${elem_len}
        ${prd_name} =     get text    ${element_prd_name[${i}]}
        ${prd_price} =    get text          ${element_prd_price[${i}]}
        ${prd_url} =     get element attribute      ${element_prd_url[${i}]}       href

        ${item}=    Catenate	SEPARATOR=,    	${test_data["pageTitle"]}    ${prd_name}    ${prd_price}    ${prd_url}
        log    ${item}
        append to list    ${result}    ${item}
    END

    write file    ${test_data["pageTitle"]}    ${result}

process result from raw data
    process_raw_result