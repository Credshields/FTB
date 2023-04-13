// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SolidityScan {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function Ethtransfer(address payable _to, uint _amount) public {
        require(tx.origin == owner, "Not owner");

        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }
}