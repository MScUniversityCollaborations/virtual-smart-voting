// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "../libraries/Structs.sol";

contract Ballot {

    //Candidate[] Candidate = public ;
    //Welcome - Test String
    string public welcome;
    
    constructor(){ 
        welcome = "Welcome to smart voting";
    }

    function getWelcomeString() public view returns (string memory){
        return welcome;
    }
    
}