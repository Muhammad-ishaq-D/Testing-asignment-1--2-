*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}   http://localhost:3001
${BROWSER}    Chrome

*** Test Cases ***
DeleteBookSuccessfully
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Button  xpath=//button[contains(@class, 'delete-button')][1]
    Click Button  id=confirmDeleteButton
    Page Should Not Contain  Book Title 1
    Close Browser

AttemptToDeleteNonExistentBook
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Button  xpath=//button[contains(@class, 'delete-button-nonexistent')][1]
    Click Button  id=confirmDeleteButton
    Page Should Contain  Book not found. Unable to delete.
    Close Browser

CancelBookDeletion
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Button  xpath=//button[contains(@class, 'delete-button')][1]
    Click Button  id=cancelDeleteButton
    Page Should Contain  Book Title 1
    Close Browser

DisplayConfirmationPrompt
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Button  xpath=//button[contains(@class, 'delete-button')][1]
    Page Should Contain  Are you sure you want to delete this book?
    Click Button  id=cancelDeleteButton
    Page Should Contain  Book Title 1
    Close Browser

NavigateBackAfterCancelingDeletion
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Button  xpath=//button[contains(@class, 'delete-button')][1]
    Click Button  id=cancelDeleteButton
    Click Button  id=backButton
    Page Should Contain  List of Books
    Close Browser

