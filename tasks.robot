*** Settings ***

Documentation     Orders robots from RobotSpareBin Industries Inc.\n\n
...               Saves the order HTML receipt as a PDF file.\n\n
...               Saves the screenshot of the ordered robot.\n\n
...               Embeds the screenshot of the robot to the PDF receipt.\n\n
...               Creates ZIP archive of the receipts and the images.\n\n

Resource          ./_resources/settings.robot
Resource          ./_resources/page_objects/OrderPage.robot
Resource          ./_resources/page_objects/CookiesDialog.robot

Suite Setup       New Browser    chromium    headless=false    # true
Suite Teardown    Close Browser


*** Tasks ***

Order robots from RobotSpareBin Industries Inc
    Open order page
    Close modal
    ${orders} =    Get orders


*** Keywords ***

Open order page
    ${secret} =    Get Secret    urls
    New Page    ${secret}[order_page_url]
    Wait For Elements State    ${order_page_submit_btn}    visible
    Wait For Elements State    ${modal_content}            visible


Close modal
    Click    ${cookies_accept_btn}
    Wait For Elements State    ${modal_content}    hidden


Get orders
    [Documentation]    Download the order CSV file, read it into table
    ${secret} =    Get Secret    urls
    RPA.HTTP.Download    ${secret}[order_csv_file_url]    overwrite=true
    ${orders} =    Read table from CSV    orders.csv
    Log To Console    ${orders}
    [Return]    ${orders}
