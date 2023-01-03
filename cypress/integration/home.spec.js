
describe("The Home Page", () => {
  
  it("successfully loads", () => {
    cy.visit("/");
  });
  
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});

