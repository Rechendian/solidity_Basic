// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Function {
    function returnMany()
        public
        pure
        returns (
            uint256,
            bool,
            uint256
        )
    {
        return (5, true, 2);
    }

    function named()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        return (5, true, 2);
    }

    function assigned()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        x = 5;
        b = true;
        y = 1;
    }

    function destructuringAssignments()
        public
        pure
        returns (
            uint256,
            bool,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 i, bool b, uint256 j) = returnMany();
        (uint256 x, , uint256 y) = (1, 2, 3);

        return (i, b, j, x, y);
    }

    function arrayInput(uint256[] memory _arr) public {}

    // Can use array for output
    uint256[] public arr = [1,1,2];

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}
