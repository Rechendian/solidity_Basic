// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//  How much ether do you need to pay for a transaction?  一笔交易需要支付多少以太币？
//      You pay gas spent * gas price amount of ether, where  您支付消耗的gas * 以太的gas价格金额，其中
//      gas is a unit of computation  气体是计算单位
//      gas spent is the total amount of gas used in a transaction 消耗的gas是交易中使用的gas总量
//      gas price is how much ether you are willing to pay per gas 汽油价格是您愿意为每份汽油支付多少以太币
//  Transactions with higher gas price have higher priority to be included in a block.  Gas 价格较高的交易有更高的优先级被包含在区块中。
//  Unspent gas will be refunded.   未用完的天然气将被退还。
//  Gas Limit Gas 限制
//      There are 2 upper bounds to the amount of gas you can spend 您可以花费的 Gas 量有 2 个上限
//      gas limit (max amount of gas you're willing to use for your transaction, set by you)    Gas 限制（您愿意用于交易的最大 Gas 量，由您设置）
//      block gas limit (max amount of gas allowed in a block, set by the network)  区块 Gas 限制（区块中允许的最大 Gas 量，由网络设置）
contract Gas {
    uint256 public i = 0;

    // Using up all of the gas that you send causes your transaction to fail. 用完您发送的所有 Gas 会导致交易失败。
    // State changes are undone.    状态更改被撤消。
    // Gas spent are not refunded.  所花费的天然气不予退还。
    function forever() public {
        // Here we run a loop until all of the gas are spent    这里我们运行一个循环，直到所有的gas都用完
        // and the transaction fails    并且交易失败
        while (true) {
            i += 1;
        }
    }
}
