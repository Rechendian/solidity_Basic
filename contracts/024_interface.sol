// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// 如果 合约C 想调用合约A  就要输入合约A 的地址 否则是调用不到的


contract A {
    uint256 public num;

    function get() public view returns (uint256) {
        return num;
    }

    function set() public {
        num = 1;
    }
}

interface B {
    function get() external view returns (uint256);

    function set() external;
}

contract C {
    function getFromB(address bAddress) public view returns (uint256) {
        B bContract = B(bAddress); // 将地址转换为接口类型
        return bContract.get(); // 调用接口方法
    }
}
