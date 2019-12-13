pragma solidity ^0.5.11;

import "./planefactory.sol";

contract PlaneFuel is PlaneFactory {

function _triggerCooldown(Plane storage _plane) internal {
    _plane.readyTime = uint32(now + cooldownTime);
  }

  function _isReady(Plane storage _plane) internal view returns (bool) {
      return (_plane.readyTime <= now);
  }

}