// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//  require 用于在执行之前验证输入和条件。
//  reverse 类似于require。有关详细信息，请参阅下面的代码。
//  assert  用于检查不应为false的代码。断言失败可能意味着存在错误。
contract Error1 {
    function testRequire(uint256 _i) public pure {
        require(_i < 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        if (_i < 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num = 1;

    function testAssert() public view {
        assert(num == 0);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}
