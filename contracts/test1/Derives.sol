//SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

import "./Base.sol";

contract Derived is Base {
	function modify() virtual external {
		value += 20;
        super.modify();
        // Base.modify() would also work!
	}
}