// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 



contract HellWorld{


    string private hello; 

    address payable owner; 

    //Tells the Blockchain when the owner call the Function 
    event ownerMessage(string message);





    constructor() {
        owner = payable(msg.sender);
    }


    function setMessage(string memory _message) external {
        hello = _message; 
    }


    function returnMessage() external view returns (string memory){
        return  hello; 
    }




    modifier onlyOwner() {

        require(msg.sender == owner);
        emit ownerMessage("The Owner Has Call the Authorised Function");
        _; 
    }

}