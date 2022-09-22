// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

import "../libraries/Constants.sol";


contract Ballot {

    struct Candidate {
        uint id;
        string electionCenterName;
        uint votes;
        uint[] votersArray;
      
    }

    string private welcome;
    uint private candidateID;
    uint public idVoter;

    constructor(){ 
        welcome = "Welcome to smart voting ";
    }


    struct Voter { 
        uint id;
        address voterAddress;
        uint electionCenter;
        bool isEnrolledInCenter;
        bool hasVoted;
    }

     mapping(address=>Voter) voterStruct;

    function addVoter(address _voterAddress, uint _id) private {
        voterStruct[_voterAddress].voterAddress = _voterAddress;
        voterStruct[_voterAddress].id = _id;
    }

    address[] votersAddress;

    // // Adds one address to the storage addresses array 
    // function getAddressFromGanache(address addr) public {
    //     votersAddress.push(addr);
    // }

    // Replaces the storage addresses with this new array of addresses
    function addAddresses(address[] calldata _addresses) public {
        votersAddress = _addresses;
    }

    function ruternAddresses() public view returns(address[] memory){
        // Makes a copy of the storage address in memory to save gas
        address[] memory votersAddresses = votersAddress;

        return votersAddresses;
    }

    // Does something on the storage array of addresses
    function operateOnStorageArrayOfAddresses() public returns(address[] memory){
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        for(uint256 i = 0; i < addressesCopy.length; i++) {
            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter);


            //uint randNumber = randMod();
            
            // if( 0 >= randNumber && 1 <= randNumber) { 

                
            // } else if( 2 >= randNumber &&  3 <= randNumber ){
               

            // } else if( 4 >= randNumber &&  5 <= randNumber ){
               

            // } else if( 6 >= randNumber &&  7 <= randNumber ){
               

            // } else if( 8 >= randNumber &&  9 <= randNumber){

               
            // } else {
               
            // } 
 

        }
        return addressesCopy;
    }

    function getVoter(address _voterAddress) external view returns(uint, address) {
        return (voterStruct[_voterAddress].id, 
                voterStruct[_voterAddress].voterAddress);
    }









    // Election centers code block
    struct ElectionCenter {
        uint id;
        string electionCenter;
        uint voters;
        address[] votersArray;
    }

    mapping(uint=>ElectionCenter) centerStruct;

    function setCenters(
    ) public {
        for (uint i = 1; i <= 5; i++) {
                addCenter(i,0);
        }
    }

    function addCenter(uint _id, uint _voters) private {
        centerStruct[_id].id = _id;
        centerStruct[_id].electionCenter = string.concat("Election Center: ", uint2str(_id));
        centerStruct[_id].voters = _voters;
    }

    function getCenter(uint _id) external view returns(string memory, uint) {
        return (centerStruct[_id].electionCenter, 
                centerStruct[_id].voters);
    }

    function addVotersToCenter(address _address, uint _id) private{
        centerStruct[_id].id = _id;
        centerStruct[_id].voters = centerStruct[_id].voters + 1;
        centerStruct[_id].votersArray.push(_address);
    }

    function getVotersFromCenter(uint _id) external view returns(string memory, uint,address  [] memory) {
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

    // Initializing the state variable
    uint randNonce = 0;
    
    // Defining a function to generate a random number
    function randMod() public
    returns(uint) {
        // increase nonce
        randNonce++; 
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp,randNonce))) % 10 ;
    }

    //------ End code fo Utils ------\\
}
