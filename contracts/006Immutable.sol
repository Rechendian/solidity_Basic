// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
//不可变变量就像常量。不可变变量的值可以在构造函数内设置，但之后不能修改。
//immutable != constants
contract Immutables {
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}

contract Immutables1 {
    uint256 public immutable MY_STRING = 0;

    constructor(uint256 _myString) {
        MY_STRING = _myString;
    }
}

contract Immutables2 {
    uint256 public immutable MY_STRING = 0;

    constructor() {
        MY_STRING = 22;
    }
}
