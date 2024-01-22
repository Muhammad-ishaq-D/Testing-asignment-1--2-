describe('Registration Functionality', () => {
  beforeEach(() => {
      cy.visit('http://localhost:3001/register');
  });

  it('Registers a new user successfully', () => {
      cy.get('#name').type('Test User');
      cy.get('#email').type('testuser@example.com');
      cy.get('#password').type('Test1234');
      cy.get('#confirmPassword').type('Test1234');
      cy.get('#registerButton').click();
      cy.url().should('include', '/home');
      cy.contains('Welcome to Book App');
  });

  it('Displays error message on existing email during registration', () => {
      cy.get('#name').type('Another Test User');
      cy.get('#email').type('testuser@example.com'); // Existing email
      cy.get('#password').type('AnotherTest1234');
      cy.get('#confirmPassword').type('AnotherTest1234');
      cy.get('#registerButton').click();
      cy.contains('Email address is already in use');
  });

  it('Displays error message on mismatched password and confirm password', () => {
      cy.get('#name').type('Mismatched Password User');
      cy.get('#email').type('mismatched@example.com');
      cy.get('#password').type('MismatchedTest1234');
      cy.get('#confirmPassword').type('MismatchedTest5678');
      cy.get('#registerButton').click();
      cy.contains('Password and confirm password must match');
  });

  it('Displays error message on weak password during registration', () => {
      // Assuming you have registration form fields with IDs: name, email, password, confirmPassword, and registerButton
      cy.get('#name').type('Weak Password User');
      cy.get('#email').type('weakpassword@example.com');
      cy.get('#password').type('weak');
      cy.get('#confirmPassword').type('weak');
      cy.get('#registerButton').click();
      cy.contains('Password must be at least 6 characters long and include a mix of letters, numbers, and symbols');
  });

  it('Redirects to login page after successful registration', () => {
      cy.get('#name').type('Success User');
      cy.get('#email').type('successuser@example.com');
      cy.get('#password').type('SuccessTest1234');
      cy.get('#registerButton').click();
      cy.url().should('include', '/login');
      cy.contains('Successfully registered! Please log in.');
  });
});

