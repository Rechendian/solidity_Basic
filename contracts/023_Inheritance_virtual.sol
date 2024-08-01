// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract virtualA  {
    function foo() public pure virtual returns (string memory){
        return "foo-A";
    }
}

