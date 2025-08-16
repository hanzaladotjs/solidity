// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] memory numbers) external pure returns(uint[] memory) {

        
        uint evenNumbers =0;
        for(uint i=0; i<numbers.length; i++){
            if(numbers[i] % 2 ==0){
                evenNumbers++;
            }
        }

        uint[] memory nwArray = new uint[](evenNumbers);
        uint filledIndex = 0;
        for(uint i=0; i<numbers.length; i++){
            if(numbers[i] % 2 == 0){
                nwArray[filledIndex] = numbers[i];
                filledIndex++;
            }
        }
        return nwArray;
    }
}
