// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
        mapping (address => bool) proposalMap;
    }

    Proposal[] public proposals;
    address public deployer = msg.sender;
    mapping (address => bool) memberMap;
  

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
    


    constructor (address[] memory addresses) public {
        for(uint i; i<addresses.length; i++){
            memberMap[addresses[i]] = true;
        }
    }

 

    function newProposal (address _target, bytes memory _calldata) external {
        if(msg.sender != deployer) {
            require(memberMap[msg.sender] == true);
        }
        proposals.push(); 
        Proposal storage p = proposals[proposals.length - 1];
        p.target = _target;
        p.data = _calldata;
        emit ProposalCreated(proposals.length -1);

        
    }

    function castVote(uint _proposalId, bool vote) external {
        if(msg.sender != deployer) {
            require(memberMap[msg.sender] == true);
        }
       Proposal storage proposal = proposals[_proposalId];

        bool lastVote = proposal.proposalMap[msg.sender];

       

       if (proposal.yesCount > 0 && lastVote) {
        proposal.yesCount--;
      } 
      if (proposal.noCount > 0 && !lastVote) {
        proposal.noCount--;
       }

        
        if (vote) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
         emit VoteCast(_proposalId, msg.sender);
        proposal.proposalMap[msg.sender] = vote;

        if(proposal.yesCount >= 10 && !proposal.executed){
            (bool success, ) = proposal.target.call(proposal.data);
            require(success);
        }
       
    }
    
}
