*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}   http://localhost:3001
${BROWSER}    Chrome
${NEW_BOOK_TITLE}   New Book
${NEW_BOOK_AUTHOR}  New Author
${NEW_BOOK_GENRE}   sci fi
${EXISTING_BOOK_TITLE}   Existing Book
${EXISTING_BOOK_AUTHOR}  Existing Author
${EXISTING_BOOK_GENRE}   Non-Fiction
${WEAK_PASSWORD}   weakpassword

*** Test Cases ***
StoreNewBookSuccessfully
    Open Browser  ${BASE_URL}/add-book  ${BROWSER}
    Input Text  id=title  ${NEW_BOOK_TITLE}
    Input Text  id=author  ${NEW_BOOK_AUTHOR}
    Input Text  id=genre  ${NEW_BOOK_GENRE}
    Click Button  id=storeButton
    Page Should Contain  ${NEW_BOOK_TITLE} by ${NEW_BOOK_AUTHOR}
    Close Browser

DisplayErrorMessageOnDuplicateEntry
    Open Browser  ${BASE_URL}/add-book  ${BROWSER}
    Input Text  id=title  ${EXISTING_BOOK_TITLE}
    Input Text  id=author  ${EXISTING_BOOK_AUTHOR}
    Input Text  id=genre  ${EXISTING_BOOK_GENRE}
    Click Button  id=storeButton
    Page Should Contain  Book with the same title and author already exists
    Close Browser

ValidateInputFieldsForNewBookEntry
    Open Browser  ${BASE_URL}/add-book  ${BROWSER}
    Input Text  id=title  ""
    Input Text  id=author  ${NEW_BOOK_AUTHOR}
    Input Text  id=genre  ${NEW_BOOK_GENRE}
    Click Button  id=storeButton
    Page Should Contain  Please enter a valid title
    Close Browser

RedirectToBookDetailsAfterSuccessfulEntry
    Open Browser  ${BASE_URL}/add-book  ${BROWSER}
    Input Text  id=title  Redirect Book
    Input Text  id=author  Redirect Author
    Input Text  id=genre  Mystery
    Click Button  id=storeButton
    Page Should Contain  Redirect Book by Redirect Author
    Close Browser

CancelBookEntryAndNavigateBack
    Open Browser  ${BASE_URL}/add-book  ${BROWSER}
    Click Button  id=cancelButton
    Page Should Contain  List of Books
    Close Browser

