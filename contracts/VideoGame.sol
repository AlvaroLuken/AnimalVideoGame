//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Animal.sol";

contract VideoGame is Animal {
  function attack() external {
    if(health <= 0) {
      die();
    }
    health -= 1 * defense_rate;
  }

  function evolve() external onlyOwner{
    attack_rate *= 5;
  }
}