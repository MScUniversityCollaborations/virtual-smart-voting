// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

import "../libraries/Structs.sol";
import "../libraries/Constants.sol";

contract Ballot {

    //Candidate[] Candidate = public ;
    //Utils[] utils = public new Utils() ;
    //Welcome - Test String
    string public welcome;
    uint private candidateID;

    
    constructor(){ 
        welcome = "Welcome to smart voting ";
        //Ids Strart from 1
        candidateID = 0;
        
        uint2str(candidateID);
        welcome = string.concat(welcome,uint2str(candidateID));

    }

    //Candidate mapping   
    using Structs for Structs.Candidate;
    mapping(uint => Structs.Candidate) candidateStruct;

    function insertCandidate (uint ID) 
        private returns (string memory electionCenterName, uint votes,  uint[] memory votersArray) {
            //candidateID += 1;
            electionCenterName = string.concat("Center ",uint2str(candidateID));
            candidateStruct[candidateID] = Structs.Candidate(
                candidateID,
                electionCenterName, 
                0, 
                votersArray);
        return (electionCenterName, votes, votersArray);
    }


    function setCenters() public{
       for(uint i=1; i<=5;){
            i=1+i;
           candidateID += i;
           insertCandidate(candidateID);
           require(true,"test");
            require(true,candidateStruct[1].electionCenterName); 
            require(true,candidateStruct[2].electionCenterName); 
            require(true,candidateStruct[3].electionCenterName); 
            require(true,candidateStruct[4].electionCenterName); 
            require(true,candidateStruct[5].electionCenterName); 
            require(true,candidateStruct[6].electionCenterName); 
        }


    }

    function test() public view returns(string memory test1){

        return candidateStruct[2].electionCenterName;

    }
        





















    function getWelcomeString() public view returns (string memory){
        return welcome;
    }

     function getCandidates() public pure returns (
        string memory,string memory,
        string memory,string memory,
        string memory){

        return (Constants.CANDIDATE1, Constants.CANDIDATE2, 
                Constants.CANDIDATE3, Constants.CANDIDATE4,
                Constants.CANDIDATE5);
    }
    

    function getCenters() public pure returns (
        string memory,string memory,
        string memory,string memory,
        string memory,string memory,
        string memory,string memory,
        string memory,string memory){

        return (Constants.CENTER1, Constants.CENTER2, 
                Constants.CENTER3, Constants.CENTER4,
                Constants.CENTER5, Constants.CENTER6,
                Constants.CENTER7, Constants.CENTER8,
                Constants.CENTER9, Constants.CENTER10);
    }

    // Utils
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
