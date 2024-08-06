// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    AggregatorV3Interface internal dataFeed;

    address public owner;

    uint256 public msgValue;

    constructor() {
        owner = msg.sender;
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    function fund() external payable {
        // int256 ethInUsd = ethTousd(int256(msg.value));
        // require(ethInUsd > 10, unicode"不能少于10 U");
    }

    // 取钱
    function withdraw() public {
        require(owner == msg.sender, unicode"没有权限!!");
        payable(msg.sender).transfer(address(this).balance);
    }

    function value() external view returns (uint256) {
        return address(this).balance;
    }

    function sender() public view returns (address) {
        return msg.sender;
    }

    // 等于当前1个以太坊等于多少 10**8
    function getChainlinkDataFeedLatestAnswer() public view returns (int256) {
        (, int256 answer, , , ) = dataFeed.latestRoundData();
        return answer;
    }

    function ethTousd(int256 _weiAmout) public view returns (int256) {
        int256 ethprice = getChainlinkDataFeedLatestAnswer();
        int256 ethInusdt = (ethprice * _weiAmout) / 1e26; //10**18 == 1 eth , ethprice 10**8
        require(ethInusdt > 1, unicode"不能小于1");
        return ethInusdt;
    }
}
