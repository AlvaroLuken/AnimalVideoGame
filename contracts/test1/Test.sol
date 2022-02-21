//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Base.sol";
import "./Derives.sol";

contract Test is Base, Derives {
	uint public value = 10;

	function modify() virtual override external {
		value *= 2;
	}
}