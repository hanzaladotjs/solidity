// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    function sum(uint[5] memory aray) external pure returns(uint256){
        uint sumOfElements = 0;
        for(uint i=0; i<5; i++){
            sumOfElements = sumOfElements + aray[i];
        }
        return sumOfElements;
    }
}
