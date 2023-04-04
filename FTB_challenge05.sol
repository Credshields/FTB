pragma solidity ^0.8.0;

contract SolidityScan {
    mapping(address => uint) public balances;

    constructor() payable {}

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(address(this).balance < 1 ether, "Please add Ether to the Contract");
        require(balances[msg.sender] >= _amount, "Insufficient balance.");

        (bool result,) = msg.sender.call{value:_amount}("");
        require(result, "Failed to send ether to the recipient.");

        balances[msg.sender] -= _amount;
    }
}