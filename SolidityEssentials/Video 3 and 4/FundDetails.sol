// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// we cannot have a mapping in the struct but can have a struct in a mapping 
// mapping(uint256 => FundingRoundDetails) fundingRounds;
contract FundDetails{
enum FundingRound  { SEED, PRIVATE, PUBLIC }

struct FundingRoundDetails {
    uint256 fundingrequired;
    FundingRound round;
}

struct userinfo{
    string name;
    uint256 age;
    mapping(address=>uint256) fundingrcvd;
}
//mapping(uint256=>userinfo) users;
mapping(address=>userinfo) use;

FundingRoundDetails[] allRounds;
mapping(uint256 => FundingRoundDetails) fundingRounds;
uint256 roundCounter;
mapping (address => FundingRoundDetails) userRounds;
uint256 userCounter;

function  addUser(string memory name,uint256 age) public{
userCounter++;
userinfo storage _user = users[userCounter];
_user.name = name;
_user.age = age";
}  

function provideFunding(address _user, uint256 _amount) public {
userinfo storage _userinfo = use[_user];
_userinfo.fundingrcvd[msg.sender] = _amount;


}
function addFundingRounds() public {
    FundingRoundDetails memory details1 = FundingRoundDetails(10000,FundingRound.SEED);
    FundingRoundDetails memory details2 = FundingRoundDetails(10000,FundingRound.PRIVATE);
    FundingRoundDetails memory details3 = FundingRoundDetails(10000,FundingRound.PUBLIC);
    allRounds.push(details1);
    allRounds.push(details2);
    allRounds.push(details3);

    fundingRounds[++roundCounter] = details1;
    fundingRounds[++roundCounter] = details2;
    fundingRounds[++roundCounter] = details3;

   
}
function getRequiredFundingForFund(uint256 _roundNumber) public view returns(uint256){
    return allRounds[_roundNumber].fundingrequired;
}

function addRound(uint256 amount, uint256 round) public{
    roundCounter++;
    fundingRounds[roundCounter] = FundingRoundDetails(amount,FundingRound(round));
    userRounds[msg.sender] = FundingRoundDetails(amount,FundingRound(round));
}

function getMyRoundInfor() public view returns (FundingRoundDetails memory) {
    return userRounds[msg.sender];

}

}


