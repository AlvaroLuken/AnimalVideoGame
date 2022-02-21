//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./Mortal.sol";

contract Animal is Ownable, Mortal {
  bool public mammal;
  bool public insect;
  bool public cute;
  bool public edible;

  uint public health = 10;
  uint public defense_rate = 2;

  uint public num_legs;

  uint public x_coordinate;
  uint public y_coordinate;

  uint public attack_rate = 3;

  function move(uint _x, uint _y) virtual public {
    x_coordinate = _x * num_legs;
    y_coordinate = _y * num_legs;
  }

  function changeOwner(address _newOwner) external onlyOwner {
    owner = _newOwner;
  }
}