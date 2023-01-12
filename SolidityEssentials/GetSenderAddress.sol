// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract SolidityTest {
   constructor() {
   }
   function getResult() public view returns(address){
      uint256 blockNumber = block.number;
      uint256 timestamp = block.timestamp;
      address sender = msg.sender;
      return sender;
   }
}