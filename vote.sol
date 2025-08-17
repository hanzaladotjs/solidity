// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	Vote[] public votes;

	function createVote(Choices choice) external {
		for(uint i; i<votes.length; i++){
			if(votes[i].voter == msg.sender){
				revert ("cant vote multiple times");
			}
		}
		votes.push(Vote(choice, msg.sender));

	}

	function hasVoted(address adres) external view returns(bool) {
		for(uint i; i<votes.length; i++){
			if(votes[i].voter == adres){
				return true;
			}
		}
		return false;
	}

	function findChoice (address adres) external view returns(Choices) {
		for(uint i; i<votes.length; i++){
			if(votes[i].voter == adres){
				if(votes[i].choice == Choices.Yes){
					return Choices.Yes;
				}
			}
		}
		return Choices.No;
	}
    function changeVote(Choices choice ) external   {
		for(uint i; i<votes.length; i++){
			if(votes[i].voter == msg.sender){
				if(votes[i].choice == Choices.No){
					votes[i].choice = Choices.Yes;
				}else{
					votes[i].choice = Choices.No;
				}
			}
		}
	}
}
