// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

// import "hardhat/console.sol";
import "../libraries/Constants.sol";


contract Ballot {

    string private welcome;
    uint private idVoter;


    constructor(){ 
        welcome = "Welcome to smart voting ";
        idVoter = 1000;
        setCenters();
        setCandidate();
    }

    address[] votersCantVote;

    function ballot() public {

        uint randNumber;
        bool hasVoted;
        for(uint256 i = 1; i <= 20; i++) {

            address addr2 = addressesCopy[i];
            randNumber = i % 10;

            uint electionCenter = voterStruct[addr2].electionCenter;
            hasVoted = voterStruct[addr2].hasVoted;
            bool isEnrolledInCenter = voterStruct[addr2].isEnrolledInCenter;

            if(isEnrolledInCenter == true){
              
                //require(hasVoted == false, "You can't vote!"); 
                //require(isEnrolledInCenter == true, "You can't vote!");
                voterStruct[addr2].hasVoted = true;

                if(randNumber == 1 || randNumber == 6) { 

                    candidateStruct[1].votes = candidateStruct[1].votes + 1;
                
                    if(electionCenter == 1) { 
                        candidateStruct[1].votesFromC1 = candidateStruct[1].votesFromC1 + 1;
                    } else if( electionCenter == 2){
                        candidateStruct[1].votesFromC2 = candidateStruct[1].votesFromC2 + 1;
                    } else if( electionCenter == 3){
                        candidateStruct[1].votesFromC3 = candidateStruct[1].votesFromC3 + 1;
                    } else if(electionCenter == 4){
                        candidateStruct[1].votesFromC4 = candidateStruct[1].votesFromC4 + 1;
                    } else if( electionCenter == 5){
                        candidateStruct[1].votesFromC5 = candidateStruct[1].votesFromC5 + 1;
                    } 

                } else if(randNumber == 2 || randNumber == 7){

                    candidateStruct[2].votes = candidateStruct[2].votes + 1;
                    
                    if(electionCenter == 1) { 
                        candidateStruct[2].votesFromC1 = candidateStruct[2].votesFromC1 + 1;
                    } else if( electionCenter == 2){
                        candidateStruct[2].votesFromC2 = candidateStruct[2].votesFromC2 + 1;
                    } else if( electionCenter == 3){
                        candidateStruct[2].votesFromC3 = candidateStruct[2].votesFromC3 + 1;
                    } else if(electionCenter == 4 ){
                        candidateStruct[2].votesFromC4 = candidateStruct[2].votesFromC4 + 1;
                    } else if( electionCenter == 5){
                        candidateStruct[2].votesFromC5 = candidateStruct[2].votesFromC5 + 1;
                    } 
    
                } else if(randNumber == 3 || randNumber == 8){

                    candidateStruct[3].votes = candidateStruct[3].votes + 1;
                    
                    if(electionCenter == 1) { 
                        candidateStruct[3].votesFromC1 = candidateStruct[3].votesFromC1 + 1;
                    } else if( electionCenter == 2){
                        candidateStruct[3].votesFromC2 = candidateStruct[3].votesFromC2 + 1;
                    } else if( electionCenter == 3){
                        candidateStruct[3].votesFromC3 = candidateStruct[3].votesFromC3 + 1;
                    } else if(electionCenter == 4 ){
                        candidateStruct[3].votesFromC4 = candidateStruct[3].votesFromC4 + 1;
                    } else if( electionCenter == 5){
                        candidateStruct[3].votesFromC5 = candidateStruct[3].votesFromC5 + 1;
                    } 

                
                } else if(randNumber == 4 || randNumber == 9 ){

                    candidateStruct[4].votes = candidateStruct[4].votes + 1;
                    
                    if(electionCenter == 1) { 
                        candidateStruct[4].votesFromC1 = candidateStruct[4].votesFromC1 + 1;
                    } else if( electionCenter == 2){
                        candidateStruct[4].votesFromC2 = candidateStruct[4].votesFromC2 + 1;
                    } else if( electionCenter == 3){
                        candidateStruct[4].votesFromC3 = candidateStruct[4].votesFromC3 + 1;
                    } else if(electionCenter == 4 ){
                        candidateStruct[4].votesFromC4 = candidateStruct[4].votesFromC4 + 1;
                    } else if( electionCenter == 5){
                        candidateStruct[4].votesFromC5 = candidateStruct[4].votesFromC5 + 1;
                    } 
                
                } else if(randNumber == 5 || randNumber == 0){

                    candidateStruct[5].votes = candidateStruct[5].votes + 1;
                    
                    if(electionCenter == 1) { 
                        candidateStruct[5].votesFromC1 = candidateStruct[5].votesFromC1 + 1;
                    } else if( electionCenter == 2){
                        candidateStruct[5].votesFromC2 = candidateStruct[5].votesFromC2 + 1;
                    } else if( electionCenter == 3){
                        candidateStruct[5].votesFromC3 = candidateStruct[5].votesFromC3 + 1;
                    } else if(electionCenter == 4 ){
                        candidateStruct[5].votesFromC4 = candidateStruct[5].votesFromC4 + 1;
                    } else if( electionCenter == 5){
                        candidateStruct[5].votesFromC5 = candidateStruct[5].votesFromC5 + 1;
                    } 
                    
                }
            }else {
                votersCantVote.push(addr2);
            }

        }
        bool jj =  true;
        string memory tt = uint2str(candidateStruct[1].votes);
        require(jj == true, tt); 
    }

    function ruternVotersCantVote() public view returns(address[] memory){
       
        return votersCantVote;
    }   
    
    // Candidate code block
    struct Candidate {
        uint id;
        uint votes;
        uint votesFromC1;
        uint votesFromC2;
        uint votesFromC3;
        uint votesFromC4;
        uint votesFromC5;
        uint[] votersArray;
    }

    mapping(uint=>Candidate) candidateStruct;

    function getCandidate(uint _id) external view 
    returns(uint Id, uint votes, 
        uint votesFromC1,
        uint votesFromC2,
        uint votesFromC3,
        uint votesFromC4,
        uint votesFromC5){

        return (candidateStruct[_id].id, 
                candidateStruct[_id].votes,
                candidateStruct[_id].votesFromC1,
                candidateStruct[_id].votesFromC2,
                candidateStruct[_id].votesFromC3,
                candidateStruct[_id].votesFromC4,
                candidateStruct[_id].votesFromC5);
    }


    function setCandidate(
    ) private {
        for (uint i = 1; i <= 5; i++) {
                addCandidate(i);
        }
    }

    function addCandidate(uint _id) private {
        candidateStruct[_id].id = _id;
    }


    //------ End code for Candidate ------\\

   // Voter code block
    struct Voter { 
        uint id;
        address voterAddress;
        uint electionCenter;
        bool isEnrolledInCenter ;
        bool hasVoted;
    }

    mapping(address=>Voter) voterStruct;

    function addVoter(address _voterAddress, uint _id, uint _electionCenter, bool _isEnrolledInCenter, bool _hasVoted) private {
        voterStruct[_voterAddress].voterAddress = _voterAddress;
        voterStruct[_voterAddress].id = _id;
        voterStruct[_voterAddress].electionCenter = _electionCenter;
        voterStruct[_voterAddress].isEnrolledInCenter = _isEnrolledInCenter;
        voterStruct[_voterAddress].hasVoted = _hasVoted;
    }

    address[] votersAddress;

    // Replaces the storage addresses with this new array of addresses
    function addAddresses(address[] calldata _addresses) public {
        votersAddress = _addresses;
    }

    function ruternAddresses() public view returns(address[] memory){
        // Makes a copy of the storage address in memory to save gas
        address[] memory votersAddresses = votersAddress;

        return votersAddresses;
    }

    address[] addressesCopy;
    // Does something on the storage array of addresses
    function setVotersAndRegister() public {
        // Makes a copy of the storage address in memory to save gas
        addressesCopy = votersAddress;
        uint randNumber;
        for(uint256 i = 1; i <= 20; i++) {

            idVoter += 1;
            address addr = addressesCopy[i];
            randNumber = i % 10;
            //addVoter(addr, idVoter, 1, true, false);

            if(randNumber == 1 || randNumber == 5) { 
                addVoter(addr, idVoter, 1, true, false);
                addVotersToCenter(addr, 1);
            } else if( randNumber == 2 || randNumber == 6){
                addVoter(addr, idVoter, 2, true, false);
                addVotersToCenter(addr, 2);
            } else if( randNumber == 3 || randNumber == 7 ){
                addVoter(addr, idVoter, 3, true, false);
                addVotersToCenter(addr, 3);
            } else if(randNumber == 4 ){
                addVoter(addr, idVoter, 4, true, false);
                addVotersToCenter(addr, 4);
            } else if( randNumber == 5){
                addVoter(addr, idVoter, 5, true, false);
                addVotersToCenter(addr, 5);
            } else {
                addVoter(addr, idVoter, 0, false, false);
            } 
        }
    }

    function getVoter(address _voterAddress) external view 
    returns(uint Id, address Address, uint electionCenter, bool isEnrolledInCenter, bool hasVoted) {
        return (voterStruct[_voterAddress].id, 
                voterStruct[_voterAddress].voterAddress,
                voterStruct[_voterAddress].electionCenter,
                voterStruct[_voterAddress].isEnrolledInCenter,
                voterStruct[_voterAddress].hasVoted );
    }

    //------ End code for Voter ------\\

    // Election centers code block
    struct ElectionCenter {
        uint id;
        uint electionCenter;
        uint voters;
        address[] votersArray;
    }

    mapping(uint=>ElectionCenter) centerStruct;

    function setCenters(
    ) private {
        for (uint i = 1; i <= 5; i++) {
                addCenter(i,0);
        }
    }

    function addCenter(uint _id, uint _voters) private {
        centerStruct[_id].id = _id;
        centerStruct[_id].electionCenter = _id;
        centerStruct[_id].voters = _voters;
    }

    function getCenter(uint _id) external view returns(uint, uint) {
        return (centerStruct[_id].electionCenter, 
                centerStruct[_id].voters);
    }

    function addVotersToCenter(address _voterAddress, uint _id) private{
        centerStruct[_id].id = _id;
        centerStruct[_id].voters = centerStruct[_id].voters + 1;
        centerStruct[_id].votersArray.push(_voterAddress);
    }

    function getVotersFromCenter(uint _id) external view 
    returns(uint, uint,address  [] memory) {
        return (centerStruct[_id].electionCenter, 
                centerStruct[_id].voters,
                centerStruct[_id].votersArray
                );
    }
     
    //------ End code fo Centers ------\\

    // Info from UI-WEB 
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

    //------ End code for Utils ------\\
}
