// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// two fns can have same name if they have diff args
contract Contract {

    function double(uint x) external pure returns(uint) {
        return x*2;
    }

    function double (uint x, uint y) external pure returns (uint, uint){
        return (x*2, y*2);
    }

}
