// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct People {
        uint256 age;
        string name;
    }

    People[] public person;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addperson(uint256 _age, string memory _name) public {
        person.push(People(_age, _name));
    }

    function getPeople(uint256 _index) public view returns (People memory) {
        return person[_index];
    }
}
