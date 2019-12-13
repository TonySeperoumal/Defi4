const {
  BN,
  ether
} = require('@openzeppelin/test-helpers');
const {
  expect
} = require('chai');
const ERC21 = artifacts.require('ERC21');

contract('ERC21', function(accounts) {
      const _name = 'ERC21 Token';
      const owner = accounts[0];
      const recipient = accounts[1];

      beforeEach(async function() {
        this.ERC21Instance = await ERC21.new({
          from: owner
        });
      });

      it("propriétaire de zéro avions", async function() {
        expect(await this.ERC21Instance.balanceOf.call(owner)).to.be.bignumber.equal(new BN('0'));
      });

      it("", async function() {
        expect(await this.ERC21Instance.ownerOf.call(_tokenId)).to.be.bignumber.equal(new BN('0'))
      });

    }