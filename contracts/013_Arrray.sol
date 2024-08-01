// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array {
    uint256[] public arr;
    uint256[] public arr1 = [1, 2, 3];
    uint256[10] public arr2; //固定数组长度 无法增加删除数组长度

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        delete arr[index];
    }

    function examples() external {
        // uint[] memory a = new uint[](5);
    }
}

// 删除数组方法 保证数组顺序不变的情况
contract ArrayRemoveByShifting {
    uint256[] public arr;

    function remove(uint256 _index) public {
        //_index == 0
        require(_index < arr.length, "index of bound");
        // i = 0；0<4 i++=1  
        for (uint256 i = _index; i < arr.length -1; i++) {
            //arr[0] = arr[1]
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(0);

        // assert(arr[0] == 1);
        // assert(arr[1] == 2);
        // assert(arr[2] == 4);
        // assert(arr[3] == 5);
        // assert(arr.length == 4);

        // arr = [1];
        // remove(0);
        // assert(arr.length == 0);
    }

    function getArr() public view returns (uint256[] memory) {
        return arr;
    }
}

// 把要删除的数组下标 和 最后一位进行互换 删除
contract ArrayReplaceFromEnd {
    uint256[] public arr;
    function remove(uint256 index) public {
        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        
    }
}