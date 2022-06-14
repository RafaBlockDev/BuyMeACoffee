// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "hardhat/console.log";

contract Coffee {
    uint256 totalCoffee;

    address payable public rafa;

    event NewCoffee(
        address indexed from,
        uint256 timestamp,
        string message,
        string name
    );

    struct Coffee {
        address giver;
        string message;
        string name;
        uint256 timestamp;
    }

    Coffee[] coffee;

    constructor() payable {
        console.log("Hello! Buy me a coffee smart contract");

        rafa = payable(msg.sender);
    }

    function getAllCoffee() public view returns (Coffee[] memory) {
        return coffee;
    }

    function getTotalCoffee() public view returns (uint256) {
        console.log("We have %d total coffee received ", totalCoffee);
        return totalCoffee;
    }

    function buyCofee(
        string memory _message,
        string memory _name,
        uint256 _payAmount
    ) public payable {
        uint256 cost = 0.001 ether;
        require(_payAmount <= cost, "Insuficient Matic provided");

        totalCoffee += 1;
        console.log("%s has just sent a coffee!!", msg.sender);

        coffee.push(Coffee(msg.sender, _message, _name, block.timestamp));

        (bool success, ) = owner.call{value: _payAmount}("");

        emit NewCoffee(msg.sender, block.timestamp, _message, _name);
    }
}
