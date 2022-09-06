pragma solidity >=0.7.0 <0.9.0;

library VoterValues {
    
     struct VoterInfo{
        uint id;
        string firstName;
        string lastName;
        bool isVoted;
    }
}