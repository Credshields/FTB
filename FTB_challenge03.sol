//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Router {
    address public owner;

    function updateValue(address _value) public {
        owner = _value;
    }
}

contract EthWallet {

    //Wallet with 10 Ether in balance
    address public owner;
    Router router;

    modifier onlyOwner {
        require(msg.sender == owner, "nope");
        _;
    }

    constructor(address _router) public {
        router = Router(_router);
        owner = msg.sender;
    }

    function updateOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
    }

    function kill() external onlyOwner {
        selfdestruct(payable(owner));
    }

    function delegate(bytes memory data) external {
        address(router).delegatecall(data);
    }

    receive () external payable {}
    
}