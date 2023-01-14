// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


contract modCheck{
    uint256 public counter;
    address public treasureAddress;
    address public owner;
    uint256 public price = 0.01 ether;
    constructor() {
        owner = msg.sender;
    }
modifier verifyamount(uint256 _amount)
{
    require(price == _amount,"Incorrect value provided");
    _;
}
modifier onlyOwner() {
    require(owner == msg.sender,"Onlt owner can call");
    _;
}
function updateAmount(uint256 _value) public verifyamount(_value){
    price = _value;
    counter++;
}
function updateTreasureAddress(address _treasury) public onlyOwner {
    treasureAddress = _treasury;
}
}