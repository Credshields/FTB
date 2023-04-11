// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Crowdfunding {

    mapping(address => uint) public contributions;
    mapping(address => bool) public maliciousAddresses;
    address[] public supporters;
    address public owner;
    uint public goal;
    uint public totalCollected;
    bool public closed;

    constructor(uint _goal) {
        owner = msg.sender;
        goal = _goal;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(!closed);
        require(msg.value > 0);
        contributions[msg.sender] += msg.value;
        totalCollected += msg.value;
        if (!isSupporter(msg.sender)) {
            supporters.push(msg.sender);
        }
    }

    function isSupporter(address _address) public view returns (bool) {
        for (uint i = 0; i < supporters.length; i++) {
            if (supporters[i] == _address) {
                return true;
            }
        }
        return false;
    }

    function checkGoalReached() public onlyOwner {
        require(!closed);
        require(totalCollected >= goal);
        closed = true;
        uint amountToTransfer = address(this).balance / supporters.length;
        for (uint i = 0; i < supporters.length; i++) {
            require(payable(supporters[i]).send(amountToTransfer));
        }
    }

    function addMaliciousAddress(address _address) public onlyOwner {
        maliciousAddresses[_address] = true;
    }
}