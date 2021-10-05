*** Settings ***

Documentation     Orders robots from RobotSpareBin Industries Inc.
...               Saves the order HTML receipt as a PDF file.
...               Saves the screenshot of the ordered robot.
...               Embeds the screenshot of the robot to the PDF receipt.
...               Creates ZIP archive of the receipts and the images.

Resource          ./_resources/settings.robot
Resource          ./_resources/page_objects/OrderPage.robot
Resource          ./_resources/page_objects/CookiesDialog.robot

Suite Setup       New Browser    chromium    headless=false    # true
Suite Teardown    Close Browser


*** Tasks ***

Order robots from RobotSpareBin Industries Inc
    Open order page


*** Keywords ***

Open order page
    ${secret} =    Get Secret    urls
    New Page    ${secret}[order_page_url]
    Wait For Elements State    ${order_page_submit_btn}    visible
    Wait For Elements State    ${modal_content}            visible
