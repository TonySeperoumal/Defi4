const {BN,ether} = require('@openzeppelin/test-helpers');
const {expect} = require('chai');
const ERC721 = artifacts.require('PlaneOwnership');


contract('ERC721', function(accounts) {
      const _name = 'ERC721 Token'
      const owner = accounts[0];
      const recipient = accounts[1];

      beforeEach(async function() {
        this.ERC721Instance = await ERC721.new({from: owner});
      });

      it("propriétaire de zéro avions", async function() {
        expect(await this.ERC721Instance.balanceOf.call(owner)).to.be.bignumber.equal(new BN('0'));
      });

      it("", async function() {
        expect(await this.ERC721Instance.ownerOf.call(tokenId)).to.be.bignumber.equal(new BN('0'));
      });
  })
