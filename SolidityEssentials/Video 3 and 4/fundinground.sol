// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Enumfundinground{

enum fundinground  { seed, privte, PUBLIC }
uint256 abc = 45;

fundinground currentfund = fundinground.seed;
function getcurrentfunding() public view returns(fundinground) {
    return currentfund;
}

function changeround(fundinground _fund) public{
    // require(_fund == fundinground.seed);
    currentfund = _fund;
}


}