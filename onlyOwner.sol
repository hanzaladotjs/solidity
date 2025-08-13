// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

address public owner;
error unauthorized();

constructor() payable {
  owner = msg.sender;
}

function withdraw() public {
  


    if(msg.sender != owner){
        revert unauthorized();
    }
     
    (bool success, ) = owner.call{value: (address(this)).balance}("");
    require (success);

}

   
}
