*** Setting ***

Resource    ../settings.robot


*** Variables ***

${order_page_headline}                  .h2        # "Build and order your robot!"
${order_page_head_select}               id=head    # select strategy: by option
${order_page_legs_part_number_field}    //input[@placeholder='Enter the part number for the legs']
${order_page_address_field}             id=address
${order_page_submit_btn}                id=order


*** Keywords ***

Fill in order parameters
    [Arguments]          ${head_model}    ${body_model}    ${legs_number}    ${address}
    Select Options By    ${order_page_head_select}    text    ${head_model}
    Check Checkbox       text=${body_model}
    Fill Text            ${order_page_legs_part_number_field}    ${legs_number}
    Fill Text            ${order_page_address_field}    ${address}
