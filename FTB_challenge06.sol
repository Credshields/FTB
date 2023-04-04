// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolidityScan {
    
    address public owner;
    uint public tradingFee;
    uint totalCoins;

    constructor(uint256 _totalCoins) {
        owner = msg.sender;
        tradingFee = 15; 
        totalCoins = _totalCoins;
    }
    
    function setTradingFee(uint _fee) public {
        require(msg.sender == owner, "Only the owner can set the trading fee.");
        tradingFee = _fee;
    }
    
    function calculateFee(uint _coins) public view returns (uint) {
        return (_coins  / totalCoins) * tradingFee;
    }
    
    function executeTrade(uint _coins) public payable {
        uint fee = calculateFee(_coins);
        require(msg.value >= fee, "Insufficient trading fee.");
        uint change = msg.value - fee;
        if (change > 0) {
            payable(owner).transfer(change);
        }
    }
}