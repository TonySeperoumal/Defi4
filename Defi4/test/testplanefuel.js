const {BN,ether} = require('@openzeppelin/test-helpers');
const {expect} = require('chai');
const fuel = artifacts.require('PlaneFuel');

contract(fuel, async function() {
  const owner = accounts[0];
  const recipient = accounts[1];
  const bool = "true";

  beforeEach(async function () {
    this.fuelInstance = await fuel.new({from: owner});
  });

  it("réservoir plein", async function() {
    expect(await this.fuelInstance._isReady().to.equal(bool));
  });
})
