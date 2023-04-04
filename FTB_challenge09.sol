// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.13;

contract Solidityscan {
    mapping (address => uint256) private userBalances;

    function depositTokens() external payable {
        userBalances[msg.sender] += msg.value;
    }

    function withdrawTokens() external {
        uint256 balance = getUserBalanceTokens(msg.sender);
        require(balance > 0, "Withdraw balance");

        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Failed to send Ether");

        userBalances[msg.sender] = 0;
    }

    function getBalanceOfTokens() external view returns (uint256) {
        return address(this).balance;
    }

    function getUserBalanceTokens(address _user) public view returns (uint256) {
        return userBalances[_user];
    }
}