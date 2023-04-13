// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SolidityScan {
    uint public pastBlockTime;

    constructor() payable {}

    function spin() external payable {
        require(msg.value == 10 ether); 
        require(block.timestamp != pastBlockTime); 

        pastBlockTime = block.timestamp;

        if (block.timestamp % 15 == 0) {
            (bool sent, ) = msg.sender.call{value: address(this).balance}("");
            require(sent, "Failed to send Ether");
        }
    }
}