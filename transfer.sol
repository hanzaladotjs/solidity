// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping (address => User) public users;

	function createUser () external {
	
		require (!users[msg.sender].isActive);
		
		User memory user = User({balance:100, isActive: true});
		
		users[msg.sender]= user;
	
	
	}

	function transfer(address recep, uint amount) external {
	
		users[msg.sender].balance -= amount;
		users[recep].balance += amount;
		if(users[msg.sender].balance <0 || !users[recep].isActive){
			revert("dwe");
		}
	}


}
