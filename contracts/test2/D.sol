//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./A.sol";
import "./B.sol";
import "./C.sol";

contract D is B, C {
  // now Contract D can see x
  uint public d = x;
}


///// ABCD
// x = 10
// a = 10