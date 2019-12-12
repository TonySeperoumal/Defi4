pragma solidity ^0.5.11;

import "./factory.sol";

contract PlaneHelper{
    uint levelUpFee = 0.001 ether;

  modifier aboveLevel(uint _level, uint _planeId) {
    require(planes[_planeId].level >= _level, "Votre niveau");
    _;
  }

  function withdraw() external onlyOwner {
    owner.transfer(this.balance);
  }

  function setLevelUpFee(uint _fee) external onlyOwner {
    levelUpFee = _fee;
  }

  function levelUp(uint _planeId) external payable {
    require(msg.value == levelUpFee,"Vous n'avez pas assez de wei");
    planes[_planeId].level++;
  }

  function changeName(uint _planeId, string _newName) external aboveLevel(2, _planeId) ownerOf(_planeId) {
    planes[_planeId].name = _newName;
  }

  function changeModel(uint _planeId, uint _newModel) external aboveLevel(20, _planeId) ownerOf(_planeId) {
    planes[_planeId].model = _newModel;
  }

  function getPlanesByOwner(address _owner) external view returns(uint[]) {
    uint[] memory result = new uint[](ownerPlaneCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < planes.length; i++) {
      if (planeToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }
}