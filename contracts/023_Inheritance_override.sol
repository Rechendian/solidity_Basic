// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./023_Inheritance_virtual.sol";

contract overrideB is virtualA {
    function foo() public pure virtual override returns (string memory){
        return "foo-B";
    }
}
