// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//  Maps are created with the syntax mapping(keyType => valueType). 映射是使用语法映射（keyType=>valueType）创建的。
//  The keyType can be any built-in value type, bytes, string, or any contract. keyType可以是任何内置值类型、bytes、string 或   contract。
//  valueType can be any type including another mapping or an array.    valueType可以是任何类型，包括另一个映射或数组。
//  Mappings are not iterable.  映射是不可迭代的。
contract Mapping {
    // Mapping from address to uint  //Mapping key=address value=uint
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        // Mapping always returns a value.  Mapping返回一个值
        // If the value was never set, it will return the default value.    如果未设置值就返回一个默认值
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint256 _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}

contract Mapping1 {
    mapping(address => uint256) public myMap;

    function set() public {
        myMap[0xd9145CCE52D386f254917e481eB44e9943F39138] = 10;
    }

    function get() public view returns (uint256) {
        return myMap[0xd9145CCE52D386f254917e481eB44e9943F39138];
    }

    function del() public {
        delete myMap[0xd9145CCE52D386f254917e481eB44e9943F39138];
    }
}

contract NestedMapping1 {
    mapping(address => mapping(uint256 => bool)) public add;

    function get(address _address, uint256 _uint) public view returns (bool) {
        return add[_address][_uint];
    }

    function set(
        address _address,
        uint256 _uint,
        bool _bool
    ) public {
        add[_address][_uint] = _bool;
    }

    function del(address _address, uint256 _uint) public {
        delete add[_address][_uint];
    }
}
