// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Solidityscan {
    
    uint public myNumber;
    
    event NumberSet(uint _number, uint _timestamp);
    
    function setNumber(uint _number) public {
        require(_number > 0, "Please enter a number that is greater than zero");
        myNumber = _number;
        emit NumberSet(_number, block.timestamp);
    }
}
