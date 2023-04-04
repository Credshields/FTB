// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract SolidityScan {
    
    mapping(address => uint) public balances;
    mapping(address => uint) public lockTime;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 1 weeks;
    }

    function addLockTime(uint _seconds) public {
        lockTime[msg.sender] += _seconds;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0);
        require(block.timestamp > lockTime[msg.sender]);
        balances[msg.sender] = 0;
        msg.sender.transfer(balances[msg.sender]);
    }
}