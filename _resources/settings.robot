*** Settings ***

Library    RPA.Robocorp.Vault
Library    RPA.Browser.Playwright    retry_assertions_for=5    enable_playwright_debug=True
Library    RPA.HTTP
Library    RPA.Tables
Library    RPA.PDF


*** Variables ***

${output_dir}        ${CURDIR}${/}output${/}
${screenshot_dir}    ${output_dir}screenshots${/}
${receipt_dir}       ${output_dir}receipts${/}
