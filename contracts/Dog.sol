//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Animal.sol";

contract Dog is Animal {

  function move(uint _x, uint _y) public override {
    num_legs = 4;
    super.move(_x, _y);
    x_coordinate *= 100;
    y_coordinate *= 100;
  }
  
  function bark() external {
    cute = true;
  }
}