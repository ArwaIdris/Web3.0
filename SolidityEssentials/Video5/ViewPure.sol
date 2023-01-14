// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract ViewPure{
uint256 counter;
//view can accees state variables but cannot modify them
function soSomething() public view returns(uint256){
    return counter;
}
// pure cannot even access or modift the state variables even
function checkPure(uint256 val) public pure retur(uint256){
    return val + 34;

}



}
