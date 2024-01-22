describe('Delete Books Functionality', () => {
  beforeEach(() => {
      cy.visit('http://localhost:3001/home');
  });

  it('Deletes a book successfully', () => {
      cy.get('.delete-button').first().click();
      cy.get('#confirmDeleteButton').click();
      cy.get('.book-list').should('have.length.lessThan', initialBookCount);
  });

  it('Displays error message on attempting to delete a non-existent book', () => {
      cy.get('.delete-button-nonexistent').click();
      cy.get('#confirmDeleteButton').click();
      cy.contains('Book not found. Unable to delete.');
  });

  it('Displays confirmation prompt before book deletion', () => {
      cy.get('.delete-button').first().click();
      cy.contains('Are you sure you want to delete this book?');
      cy.get('#confirmDeleteButton');
      cy.get('#cancelDeleteButton');
  });

  it('Allows user to navigate back after canceling book deletion', () => {
      cy.get('.delete-button').first().click();
      cy.get('#cancelDeleteButton').click();
      cy.get('#backButton').click();
      cy.url().should('include', '/home');
      cy.contains('Welcome to Book App');
  });
});

