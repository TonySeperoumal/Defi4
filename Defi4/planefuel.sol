pragma solidity ^0.5.11;

import "./planefactory.sol";

contract PlaneFuel is PlaneFactory {

    function _triggerCooldown(Plane storage _plane) internal {
        _plane.readyTimeFuel = uint32(block.timestamp + cooldownTime);
    }

    function _isReady(Plane storage _plane) internal view returns (bool) {
      return (_plane.readyTimeFuel <= block.timestamp);
    }

    function repairAndBuild(uint _planeId, uint _targetModel)internal ownerOf(_planeId) {
        Plane storage myPlane = planes[_planeId];
        require(_isReady(myPlane),"Votre avion n'est pas encore prêt");
        _targetModel = _targetModel % dnaModulus;
        uint newModel = (myPlane.model + _targetModel) / 2;
        _createPlane("NoNamePlane", newModel);
        _triggerCooldown(myPlane);
    }

}