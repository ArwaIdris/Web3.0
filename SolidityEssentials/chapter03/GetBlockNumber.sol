// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract SolidityTest {
   constructor() {
   }
   function getResult() public view returns(uint){
      uint256 blockNumber = block.number;
      return blockNumber;
   }
}