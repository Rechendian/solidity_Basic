// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Parent {
    uint256 public value;

    constructor(uint256 _value) {
        value = _value;
    }
}

contract Child is Parent {
    constructor(uint256 _parentValue) Parent(_parentValue){
        
    }
}
