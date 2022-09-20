// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

import "../libraries/Constants.sol";

// contract Center{
//         uint public id;
//         string public electionCenterName;
//         uint  public votes;
//         uint[] public votersArray;
// }

// contract ElectionCenter{
   
//     Center[] public Cntr;

//     function addCenter(Center center) public {
//         Cntr.push(center);
//     } 
// }

// contract Person{
//     string public FirstName;
//     string public LastName;
// }

// contract Family{
//     Person[] public People;

//     function addPerson(Person person) public {
//         People.push(person);
//     }
// }

// contract FamilyManager{
//     Family[] Families;

//     function AddFamily(Person[] memory people) public {
//         Family family = new Family();
//         for(uint x; x < people.length; x++) {
//             family.addPerson(people[x]);
//         }
//         Families.push(family);
//     }

//     function GetFamilies() public view returns (Family[] memory){
//         return Families;
//     }
// }

contract Ballot {

    struct ElectionCenter {
        uint id;
        uint voters;
        //string electionCenterName;
    }

    struct Candidate {
        uint id;
        string electionCenterName;
        uint votes;
        uint[] votersArray;
      
    }

    struct Voter { 
        uint id;
        uint voterNumber;
        string electionCenter;
        bool isEnrolledInCenter;
        bool hasVoted;
    }

    string private welcome;
    uint private candidateID;

    
    constructor(){ 
        welcome = "Welcome to smart voting ";
        //Ids Strart from 1
        candidateID = 0;
        
        uint2str(candidateID);
        welcome = string.concat(welcome,uint2str(candidateID));
    }

     
    ElectionCenter[] public electionCenters;

    // function setCenters(
    // ) public returns(ElectionCenter[] memory){
    //     for (uint i = 1; i <= 5; i++) {
    //             electionCenters.push(ElectionCenter({
    //                 id: i,
    //                 voters: 0
    //             }));
    //     }
    //     return electionCenters;
    // }


    // function setVoter(
    // ) public returns(ElectionCenter[] memory){
    //     for (uint i = 1; i <= 5; i++) {
    //             electionCenters.push(ElectionCenter({
    //                 id: i,
    //                 voters: 0
    //             }));
    //     }
    //     return electionCenters;
    // }

    //Candidate mapping   
    //Structs.Candidate[][] public candidate;
    //using Structs for Structs.Candidate;
    //mapping(uint => Candidate) CandidateStruct;
    //mapping(address => mapping(uint => bool)) public nested;
    mapping(uint => mapping(uint => Candidate)) public nested2;

    function get(uint _id) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested2[_id];
    }
    

    function set(
        uint _id,
        uint _voters
    ) public {
        nested2[_id][_voters] ;
    }


    // function insertCandidate (uint candidateID) 
    //     public returns (uint candidateNumber,
    //                     string memory electionCenterName, 
    //                     uint votes,  
    //                     uint[] memory votersArray) {
    //         candidateID += 1;
    //         electionCenterName = string.concat("Center ",uint2str(candidateID));
    //         CandidateStruct[candidateID] = Structs.Candidate(
    //             candidateID,
    //             electionCenterName, 
    //             0, 
    //             votersArray);
    //     return (candidateID, electionCenterName, votes, votersArray);
    // }

     
    // function get_last24_hours_users()
    // public
    // view
    // returns (
       
    //     bytes32[] memory current_timestamp = new bytes32[](5);
    //     address[] memory user_referrer_address = new address[](users_count);
    //     address[] memory user_address = new address[](users_count);
    // )
    // {


    // for (uint256 i = 0; i < users_count; i++) {
    //     User memory user = user[i];
    //     current_timestamp[i] = user.current_timestamp;
    //     user_referrer_address[i] = user.user_referrer_address;
    //     user_address[i] = user.user_address;
    // }
    // return (current_timestamp, user_referrer_address, user_address);
    // }















    function getWelcomeString() private view returns (string memory){
        return welcome;
    }

     function getCandidates() private pure returns (
        string memory,string memory,
        string memory,string memory,
        string memory){

        return (Constants.CANDIDATE1, Constants.CANDIDATE2, 
                Constants.CANDIDATE3, Constants.CANDIDATE4,
                Constants.CANDIDATE5);
    }
    

    function getCenters() private pure returns (
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
