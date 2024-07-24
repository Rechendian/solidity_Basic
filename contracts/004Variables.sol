// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//There are 3 types of variables in Solidity。 Solidity 三种类型变量
/*
    local 当地的
        declared inside a function      在函数内部声明
        not stored on the blockchain    不存储在区块链上
    state 状态
        declared outside a function 在函数外部声明
        stored on the blockchain    存储在区块链上 消耗gas
    global 全局
        (provides information about the blockchain) （提供有关区块链的信息）
*/

contract Variables {
    // State variables are stored on the blockchain.    状态变量存储在区块链上。
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public {
        //Local variables are not saved to the blockchain.  局部变量不会保存到区块链中。
        // uint256 i = 256;

        // Here are some global variables
        // uint256 timestamp = block.timestamp; // Current block timestamp
        // address sender = msg.sender; // address of the caller
    }
}
