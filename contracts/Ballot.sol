// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

// import "hardhat/console.sol";
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
    uint private idVoter;
    uint randNonce = 0;

    constructor(){ 
        welcome = "Welcome to smart voting ";
        idVoter = 1000;
        addVotesToCenter6();
    }

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

    // function ruternVoternsEnrollered() public   
    // returns(address[] memory){
    
    //     address[] memory addressesCopy2 = votersAddress;
    //     address[] memory addressesTRUEvoters ;
    //     for(uint256 i = 0; i < addressesCopy2.length; i++) {
    //             address addr2 = addressesCopy2[i];
    //             if(voterStruct[addr2].isEnrolledInCenter = true){
    //                 addressesTRUEvoters[i] = addr2;
    //             }
    //     }
    //     return (addressesTRUEvoters);

    // }

    // Does something on the storage array of addresses
    function operateOnStorageArrayOfAddresses()  public {
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        uint randNumber;
        for(uint256 i = 0; i <= 20; i++) {

            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter, 1, true, false);

            // randNonce++;
            // randNumber = uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp,randNonce))) % 100;

            // if( 1 >= randNumber && 20 <= randNumber) { 
            //      addVoter(addr, idVoter, 1, true, false);
            // } else if( 21 >= randNumber &&  34 <= randNumber ){
            //       addVoter(addr, idVoter, 2, true, false);
            // } else if( 36 >= randNumber &&  47 <= randNumber ){
            //       addVoter(addr, idVoter, 3, true, false);
            // } else if( 55 >= randNumber &&  75 <= randNumber ){
            //        addVoter(addr, idVoter, 4, true, false);
            // } else if( 78 >= randNumber &&  95 <= randNumber){
            //       addVoter(addr, idVoter, 5, true, false);
            // } else {
            //        addVoter(addr, idVoter, 0, false, false);
            // } 
        }
    }

    function addVotesToCenter2()  public{
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        for(uint256 i = 21; i <= 40; i++) {
            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter, 2, true, false);
        }
    }


    function addVotesToCenter3()  public{
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        for(uint256 i = 41; i <= 60; i++) {
            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter, 2, true, false);
        }
    }

    function addVotesToCenter4()  public {
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        for(uint256 i = 61; i <= 70; i++) {
            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter, 4, true, false);
        }
    }

    function addVotesToCenter5()  public{
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        for(uint256 i = 71; i <= 80; i++) {
            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter, 5, true, false);
        }


    }

     function addVotesToCenter6() internal {
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        for(uint256 i = 81; i <= 100; i++) {
            idVoter += 1;
            address addr = addressesCopy[i];
            addVoter(addr, idVoter, 0, false, false);
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

    function addVotersToCenter(address _voterAddress, uint _id) private{
        centerStruct[_id].id = _id;
        centerStruct[_id].voters = centerStruct[_id].voters + 1;
        centerStruct[_id].votersArray.push(_voterAddress);
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

    // // Initializing the state variable
    // uint randNonce2 = 0;
    
    // // Defining a function to generate a random number
    // function randMod() public
    // returns(uint, string memory) {
    //     // increase nonce
    //     randNonce2++; 
    // return (uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp,randNonce2))) % 100, "Hi random number" );
    // }

//     //------ End code fo Utils ------\\
}
