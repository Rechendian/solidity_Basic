// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//Solidity supports for, while, and do while loops. Solidity 支持 for、while 和 do while 循环。
//Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail. 不要编写无限制的循环，因为这可能会达到气体限制，导致交易失败。
//For the reason above, while and do while loops are rarely used.   由于上述原因，很少使用 while 和 do while 循环。

contract Loop {
    function loop() public pure {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }
}
