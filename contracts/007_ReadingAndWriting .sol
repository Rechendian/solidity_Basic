// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//To write or update a state variable you need to send a transaction. On the other hand, you can read state variables, for free, without any transaction fee.
//要写入或更新状态变量，您需要发送交易。另一方面，您可以免费读取状态变量，无需任何交易费用。
contract SimpleStorage {
    // State variable to store a number
    uint256 public num;

    // You need to send a transaction to write to a state variable.
    function set(uint256 _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.
    function get() public view returns (uint256) {
        return num;
    }
}
// 有涉及状态变量读取用view 不涉状态变量用pure
contract SimpleStorage1 {
    string public str;

    function set(string memory _str) public {
        str = _str;
    }

    function get() public view returns (string memory) {
        return str;
    }

    function pures() public pure returns (string memory) {
        return "pures";
    }
}

contract SimpleStorage2{
    function pures() public pure returns (string memory str) {
        str = "pures";
        return str;
    }
}
