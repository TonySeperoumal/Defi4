pragma solidity ^0.5.11;

import "./planefactory.sol";

contract PlaneAttack{

    uint randNonce = 0;
    uint attackVictoryProbability = 60;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(now, msg.sender, randNonce)) % _modulus;
  }

  function attack(uint _planeId, uint _targetId) external ownerOf(_planeId) {
    Plane storage myPlane = planes[_planeId];
    Plane storage enemyPlane = planes[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) {
      myPlane.winCount++;
      myPlane.level++;
      enemyPlane.lossCount++;
      feedAndMultiply(_planeId, enemyPlane.model, "zombie");
    } else {
      myPlane.lossCount++;
      enemyPlane.winCount++;
      _triggerCooldown(myPlane);
    }
  }
}