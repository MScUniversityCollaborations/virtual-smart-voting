// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;


contract Sender{
    
    address senderAddr;

    modifier onlySender() {
        require(msg.sender == senderAddr);
        _;
    }
    
    constructor()  {
        senderAddr = msg.sender;
    }

}
