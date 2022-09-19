// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library Structs {

    struct Candidate {
        uint id;
        string electionCenterName;
        uint votes;
        uint[] votersArray;
      
    }

    struct Voter{
        uint id;
        uint voterNumber;
        string electionCenter;
        bool isEnrolledInCenter;
        bool hasVoted;

    }
}