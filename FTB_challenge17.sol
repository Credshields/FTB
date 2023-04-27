// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SolidityScan {
    uint256 public totalAmount;

    function deposit(uint256 _amount) public {
        require(_amount >= 1, "Deposit amount must be greater than 0");
        totalAmount += _amount;
    }

    function withdraw(uint256 _amount) public {
        if (_amount > totalAmount) {
            totalAmount = 0;
        } else {
            totalAmount -= _amount;
        }
    }
}
