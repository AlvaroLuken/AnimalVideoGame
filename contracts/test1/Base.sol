//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
	uint public value = 10;

	function modify() virtual external {
		value *= 2;
	}
}