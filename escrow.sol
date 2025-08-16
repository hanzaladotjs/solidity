// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;


contract Escrow {

    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved (uint);

    constructor (address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    receive() external payable {

    }

    function approve() external  {
        if(msg.sender != arbiter ){
            revert ("not approved");
        }
        uint256 balance = address(this).balance;
        (bool success, ) = beneficiary.call{value : balance }("");
        emit Approved(balance);
        require (success);
        
    }



}
