describe('Search Functionality', () => {
  beforeEach(() => {
      cy.visit('http://localhost:3001/search');
  });

  it('Searches for books and displays results', () => {
      cy.get('#searchInput').type('computer');
      cy.get('#searchButton').click();
      cy.get('.search-results').should('have.length.greaterThan', 0);
  });

  it('Displays appropriate message on no search results', () => {
      cy.get('#searchInput').type('Non-existent Book');
      cy.get('#searchButton').click();
      cy.contains('No results found for "Non-existent Book"');
  });

  it('Allows user to click on a search result and view book details', () => {
      cy.get('#searchInput').type('computer');
      cy.get('#searchButton').click();
      cy.get('.search-result-link').first().click();
      cy.url().should('include', '/book-details');
      cy.contains('Book Details');
  });

  it('Allows user to refine search results using filters', () => {
      cy.get('#searchInput').type('sci fi');
      cy.get('#genreFilter').select('sci fi');
      cy.get('#searchButton').click();
      cy.get('.search-results').should('have.length.greaterThan', 0)
  });

  it('Displays error message on invalid search query', () => {
      cy.get('#searchInput').type(''); 
      cy.get('#searchButton').click();
});
});
 
