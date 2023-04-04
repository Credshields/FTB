// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IConvenience} from 'IConvenience.sol';
import {IPair} from 'IPair.sol';
import {ERC721Permit} from 'ERC721Permit.sol';

contract SolidityScan is  ERC721Permit {
    IConvenience public immutable override convenience;
    IPair public immutable override pair;
    uint256 public immutable override maturity;

    constructor(
        IConvenience _convenience,
        IPair _pair,
        uint256 _maturity
    ) ERC721Permit('Timeswap Collateralized Debt') {
        convenience = _convenience;
        pair = _pair;
        maturity = _maturity;
    }

    modifier onlyConvenience() {
        require(msg.sender == address(convenience), 'E403');
        _;
    }

    function safeMint(address to, uint256 id) external onlyConvenience {
        _safeMint(to, id);
    }

    function burn(
        address to,
        uint256[] memory ids,
        uint112[] memory assetsIn,
        uint112[] memory collateralsOut,
        bytes calldata data
    ) external onlyConvenience returns (uint128 assetIn, uint128 collateralOut) {
        (assetIn, collateralOut) = pair.pay(maturity, to, address(this), ids, assetsIn, collateralsOut, data);
    }
}