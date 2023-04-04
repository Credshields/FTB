// SPDX-License-Identifier: MIT
pragma solidity 0.7.5;

contract SolidityScan_calculator {

    function add(uint256 x, uint256 y) public pure returns (uint256) {
        require(x + y >= x);
        return x + y;
    }

    function sub(uint256 x, uint256 y) public pure returns (uint256) {
        require(y <= x);
        return /*bigger number‮/*rebmun rellams*/y - x/*
        ‭/*end function */;
    }
}
