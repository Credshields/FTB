// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    constructor(uint256 _totalSupply) {
        balances[msg.sender] = _totalSupply;
        totalSupply = _totalSupply;
    }

    function transfer(
        address _to,
        uint256 _amount
    ) public returns (bool success) {
        require(balances[msg.sender] >= _amount);
        require(_to != address(0));

        for (uint i = 0; i < _amount; i++) {
            balances[msg.sender]--;
            balances[_to]++;
            return true;
        }
    }
}
