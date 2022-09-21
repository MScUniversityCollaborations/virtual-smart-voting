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

    constructor(){ 
        welcome = "Welcome to smart voting ";
    }

    function setCenters(
    ) public {
        for (uint i = 1; i <= 5; i++) {
                addCenter(i,0);
        }
    }

    struct Voter { 
        uint id;

        uint voterNumber;
        string electionCenter;
        bool isEnrolledInCenter;
        bool hasVoted;
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

    // Does something on the storage array of addresses
    function operateOnStorageArrayOfAddresses() public view returns(address[] memory){
        // Makes a copy of the storage address in memory to save gas
        address[] memory addressesCopy = votersAddress;
        // for(uint256 i = 0; i < addressesCopy.length; i++) {
        //     address addr = addressesCopy[i];
        //     // do something with addr

        // }
        return addressesCopy;
    }



    // Election centers code block
    struct ElectionCenter {
        uint id;
        string electionCenter;
        uint voters;
        address[] votersArray;
    }

    mapping(uint=>ElectionCenter) centerStruct;

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
