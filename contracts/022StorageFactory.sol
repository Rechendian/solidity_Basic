// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./021SimpleStorage.sol";

contract SimpleStorageFactory {
    SimpleStorage[] public storages;

    function new1() public {
        SimpleStorage s = new SimpleStorage();
        storages.push(s);
    }

    function store2(uint256 _index, uint256 _store2) public {
        storages[_index].store(_store2);
    }

    function retrieve2(uint256 _index) public view returns (uint256) {
        return storages[_index].retrieve();
    }

    function addperson2(
        uint256 _index,
        uint256 _age,
        string memory _name
    ) public {
        storages[_index].addperson(_age, _name);
    }

    function getPeople1(uint _index, uint _personIndex) public view returns (uint256, string memory) {
        SimpleStorage s = storages[_index];
        SimpleStorage.People memory person = s.getPeople(_personIndex);
        return (person.age, person.name);
    }
}
