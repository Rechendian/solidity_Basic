// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// indexed 含义
//      1.索引参数: 使用 indexed 关键字标记的参数会被编入日志的主题（topics）中，便于区块链节点进行搜索和过滤。每个事件最多可以有三个 indexed 参数。
//      2.提高查询效率: 索引参数使得客户端应用（如 DApps）可以高效地查询特定的事件。例如，可以快速找到由某个地址发送的所有事件。
//      3.限制数量: 一个事件最多只能有三个 indexed 参数。这是为了限制事件日志的大小和复杂性，确保查询效率。

contract Event {
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
