describe("The add to cart button", () => {
  
  it("successfully loads", () => {
    cy.visit("/");
  });
  
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Adds a product to cart", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true});    
  });
  
  it("Changes the number when the add to cart button is clicked", () => {
    cy.get('.end-0 > .nav-link').should('contain', "My Cart (1)")
  })
});