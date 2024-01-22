*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}   http://localhost:3001
${BROWSER}    Chrome

*** Test Cases ***
DisplayListOfBooks
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Page Should Contain  List of Books
    Close Browser

NavigateToSpecificBook
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Link  link=Book Title 1
    Page Should Contain  Book Details
    Close Browser

AddNewBook
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Button  id=addBookButton
    Page Should Contain  Add New Book
    Close Browser

EditBook
    Open Browser  ${BASE_URL}/home  ${BROWSER}
    Click Link  link=Edit Book 1
    Page Should Contain  Edit Book
    Close Browser