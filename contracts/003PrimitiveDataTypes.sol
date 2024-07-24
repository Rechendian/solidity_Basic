// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Primitives {
    bool public boo = true;
    uint8 public u8 = 1; //uint8 最大=2**8-1
    uint256 public u256 = 456; //uint256 最大=2**256-1
    uint256 public u = 123; //uint == uint256

    int8 public i8 = 1; //int8 = -2**8 || 2**8
    int256 public i256 = 456; //int256 == -2**256||2**256
    int256 public i = -123; //int == int256

    //int 最大值||最小值
    int256 public minInt = type(int256).min; //57896044618658097711785492504343953926634992332820282019728792003956564819967
    int256 public maxInt = type(int256).max; //-57896044618658097711785492504343953926634992332820282019728792003956564819968

    address public addr = address(this); //合约地址

    function funAddress() public {
        //调用者地址
        addr = msg.sender;
    }

    bytes1 a = 0xb5;
    bytes1 b = 0x56;

    //默认值
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
