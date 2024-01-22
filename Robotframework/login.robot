*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}   http://localhost:3001
${BROWSER}    Chrome
${USERNAME}   testuser@example.com
${PASSWORD}   testpassword
${INVALID_USERNAME}   invaliduser@example.com
${INVALID_PASSWORD}   invalidpassword
${FORGOT_PASSWORD_EMAIL}   validuser@example.com
${INVALID_FORGOT_PASSWORD_EMAIL}   invalidemail@example.com

*** Test Cases ***
Login With Valid Credentials
    Open Browser  ${BASE_URL}/login  ${BROWSER}
    Input Text  id=email  ${USERNAME}
    Input Text  id=password  ${PASSWORD}
    Click Button  id=loginButton
    Page Should Contain  Welcome to Book App
    Close Browser

Login With Invalid Credentials
    Open Browser  ${BASE_URL}/login  ${BROWSER}
    Input Text  id=email  ${INVALID_USERNAME}
    Input Text  id=password  ${INVALID_PASSWORD}
    Click Button  id=loginButton
    Page Should Contain  Invalid email or password
    Close Browser

Navigate to Forgot Password Page
    Open Browser  ${BASE_URL}/login  ${BROWSER}
    Click Link  link=Forgot Password?
    Page Should Contain  Password Recovery
    Close Browser

Recover Password With Valid Email
    Open Browser  ${BASE_URL}/forgot-password  ${BROWSER}
    Input Text  id=email  ${FORGOT_PASSWORD_EMAIL}
    Click Button  id=recoverButton
    Page Should Contain  Password recovery email sent. Please check your inbox.
    Close Browser

