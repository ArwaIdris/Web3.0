// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract AllAboutInts {
uint stateUInt = 20; //state variable
uint stateInt = 20; //state variable
function UIntAssignment() public returns (uint)
{
uint256 memoryuint = 266;
uint8 memoruint8 = 8; 
uint256 result = memoruint8 + memoryuint;
return result;
}

function IntAssignment() public
{
int memoryInt = 256;
int256 memoryInt256 = 256;
int8 memoryInt8 = 8; 
}
}