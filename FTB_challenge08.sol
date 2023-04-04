// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolidityScanGame {
    bytes32 public constant hash =
        0x3c2a56b8f3daa6b1f18cb04f6f0a6c4a6fa2f0c02a0b7c6b198877d4b13f4f8c;

    constructor() payable {}

    function solve(string memory solution) public {
        require(hash == keccak256(abi.encodePacked(solution)), "Incorrect answer");

        (bool sent, ) = msg.sender.call{value: 10 ether}("");
        require(sent, "Failed to send Ether");
    }
}