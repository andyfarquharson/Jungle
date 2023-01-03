describe("The product page", () => {
  
  it("successfully loads the home page", () => {
    cy.visit("/");
  });
  it("successfully loads the products page", () => {
    cy.visit("/products/2");
  });



});
