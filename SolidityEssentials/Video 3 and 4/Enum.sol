// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Enum{

enum freshJuiceSize  { small,medium,large,extralarge }
uint256 abc = 45;

freshJuiceSize juice = freshJuiceSize.medium;
function getJuice() public view returns(freshJuiceSize) {
    return juice;
}

function updateJuiceSize(freshJuiceSize _juice) public{
    juice = _juice;
}

function verifyJuiceSize() public view returns(bool){
    return juice == freshJuiceSize.extralarge;
}
}