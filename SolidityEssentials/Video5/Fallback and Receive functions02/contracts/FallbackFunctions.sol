// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract FallbackFunctions{

uint256 public countReceive;
uint256 public countFallback;
mapping(address=>uint256) public receiveBalance;
mapping(address=> uint256) public fallbackBalance;

    function addSome() public {
        countReceive+=20;
        countFallback+=20;
    }
    receive() external payable{
    countReceive++;
    receiveBalance[msg.sender] += msg.value;
    }

    fallback() external payable{
        countFallback++;
        fallbackBalance[msg.sender] += msg.value;
    }
}

contract Testfunction{

    function TestfunctionCall(address _contractAddress,string memory _signature) public 
        {

        (bool success,) = _contractAddress.call(abi.encodeWithSignature(_signature));
        require(success);
        }
    }
    
