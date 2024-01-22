*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}   http://localhost:3001
${BROWSER}    Chrome

*** Test Cases ***
SearchForBooksAndDisplayResults
    Open Browser  ${BASE_URL}/search  ${BROWSER}
    Input Text  id=searchInput  Harry Potter
    Click Button  id=searchButton
    Page Should Contain  Search Results for "computer"
    Close Browser

RefineSearchResultsWithFilters
    Open Browser  ${BASE_URL}/search  ${BROWSER}
    Input Text  id=searchInput  sci fi
    Select From List by Value  id=genreFilter  Fantasy
    Click Button  id=searchButton
    Page Should Contain  Search Results for "sci fi"
    Close Browser

ClickOnSearchResultAndViewBookDetails
    Open Browser  ${BASE_URL}/search  ${BROWSER}
    Input Text  id=searchInput  Harry Potter
    Click Button  id=searchButton
    Click Link  link=View Details for "computer"
    Page Should Contain  Book Details
    Close Browser

DisplayErrorMessageOnNoSearchResults
    Open Browser  ${BASE_URL}/search  ${BROWSER}
    Input Text  id=searchInput  Non-existent Book
    Click Button  id=searchButton
    Page Should Contain  No results found for "Non-existent Book"
    Close Browser

DisplayErrorMessageOnInvalidSearchQuery
    Open Browser  ${BASE_URL}/search  ${BROWSER}
    Input Text  id=searchInput  ""
    Click Button  id=searchButton
    Page Should Contain  Please enter a valid search query
    Close Browser
