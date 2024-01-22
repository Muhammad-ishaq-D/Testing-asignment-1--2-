*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}   http://localhost:3001
${BROWSER}    Chrome
${NEW_USER_NAME}   New User
${NEW_USER_EMAIL}   newuser@example.com
${EXISTING_USER_EMAIL}   existinguser@example.com
${VALID_PASSWORD}   NewPass1234
${WEAK_PASSWORD}   weakpass
${REGISTRATION_ERROR_MESSAGE}   Email address is already in use

*** Test Cases ***
Register New User Successfully
    Open Browser  ${BASE_URL}/register  ${BROWSER}
    Input Text  id=name  ${NEW_USER_NAME}
    Input Text  id=email  ${NEW_USER_EMAIL}
    Input Text  id=password  ${VALID_PASSWORD}
    Input Text  id=confirmPassword  ${VALID_PASSWORD}
    Click Button  id=registerButton
    Page Should Contain  Successfully registered!.
    Close Browser

Attempt Registration with Existing Email
    Open Browser  ${BASE_URL}/register  ${BROWSER}
    Input Text  id=name  Another User
    Input Text  id=email  ${EXISTING_USER_EMAIL}
    Input Text  id=password  AnotherPass1234
    Input Text  id=confirmPassword  AnotherPass1234
    Click Button  id=registerButton
    Page Should Contain  ${REGISTRATION_ERROR_MESSAGE}
    Close Browser

Validate Weak Password during Registration
    Open Browser  ${BASE_URL}/register  ${BROWSER}
    Input Text  id=name  Weak User
    Input Text  id=email  weakuser@example.com
    Input Text  id=password  ${WEAK_PASSWORD}
    Click Button  id=registerButton
    Page Should Contain  Password must be at least 6 characters long and include a mix of letters, numbers, and symbols
    Close Browser

Validate Password Mismatch during Registration
    Open Browser  ${BASE_URL}/register  ${BROWSER}
    Input Text  id=name  Mismatched User
    Input Text  id=email  mismatcheduser@example.com
    Input Text  id=password  Mismatch1234
    Input Text  id=confirmPassword  Mismatch5678
    Click Button  id=registerButton
    Page Should Contain  Password and confirm password must match
    Close Browser

Navigate to Login Page after Successful Registration
    Open Browser  ${BASE_URL}/register  ${BROWSER}
    Click Link  link=Already have an account? Log in
    Page Should Contain  Login to Book App
    Close Browser
