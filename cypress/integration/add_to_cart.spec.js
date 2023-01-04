describe("The add to cart button", () => {
  
  it("successfully loads", () => {
    cy.visit("/");
  });
  
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Changes the number when the add to cart button is clicked", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn')    

  });
});