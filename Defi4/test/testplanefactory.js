const {BN,ether} = require('@openzeppelin/test-helpers');
const {expect} = require('chai');
const factory = artifacts.require('PlaneFactory');

contract(factory, function (account) {
  const owner = accounts[0];
  const recipient = accounts[1];

  beforeEach(async function () {
    this.factoryInstance = await factory.new({from: owner});
  });

  it("génère un avion", async function() {
    expect(await this.factoryInstance.createRandomPlane.call(owner).to.be.bignumber.equal(new BN('1')));
  });
})
