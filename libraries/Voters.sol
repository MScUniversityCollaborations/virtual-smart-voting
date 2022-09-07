// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library Voters {
    
    struct Voter{
        uint id;
        uint voterNumber;
        string electionCenter;
        bool isEnrolledInCenter;
        bool hasVoted;

    }
}