// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./021SimpleStorage.sol";

contract inherit is SimpleStorage {
    function get() public view returns (uint) {
        return favoriteNumber;
    }
}
