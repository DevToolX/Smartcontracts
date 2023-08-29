// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore  {

    //The Whole point is that we can see and Interact wit this contract

    event withdrawevent(address user, string message);
    event depositevent (address personDeposit, string message); 


    //Keep TRack of all the Balance for the people in the contract 
    mapping(address => uint) public balances; 


    function deposit() public payable {

        balances[msg.sender] += msg.value;
        emit depositevent(msg.sender, "There is an Depsoit!");

    }


    function withdraw() public {
    
    uint256 bal = balances[msg.sender];
    require(bal > 0);
    (bool sent, ) = msg.sender.call{value: bal}("");
    require(sent, "Failed to send Ether");

    balances[msg.sender] = 0;
    emit withdrawevent(msg.sender, "There was an Withdraw");


    }



    //then We got some Helper Function 
    function getBalance() public view returns (uint)
    {
        return address(this).balance;

    }    

    
    }