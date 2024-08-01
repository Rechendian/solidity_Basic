// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Example {
    event Received(address, uint);
    event FallbackCalled(address, uint);

    // 处理接收纯以太币的情况，必须是 external 和 payable
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // 处理未匹配的函数调用以及其他情况，必须是 external
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value);
    }
}
