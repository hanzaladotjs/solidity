

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/console.sol";
contract Contract {
    address public charity; 

	constructor(address _charity) payable {
        charity = _charity;

		console.log( address(this) ); // 0x7c2c195cd6d34b8f845992d380aadb2730bb9c6f
		console.log( address(this).balance ); // 0

      
        
	}

    receive() external payable{

    }
      function donate() external payable {
           (bool s,)= charity.call{value: address(this).balance}("");
           require(s);
           selfdestruct(payable(msg.sender));
        }
}
