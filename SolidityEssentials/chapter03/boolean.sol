// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract BoolContract {
bool isPaid = true;

function changeBool() public returns (bool) {
isPaid = false;
return isPaid; //returns false
}

// function convertToUint() public returns (uint8) {
// isPaid = false;
// return uint8(isPaid); //error
// }
function getbool() public view returns (bool){
    return isPaid;
}
}