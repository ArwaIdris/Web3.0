// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20 {
    uint constant _initial_supply = 100 * (10**18);
    constructor() ERC20("QTKNRegistration", "QTKN") {
        _mint(msg.sender, _initial_supply);
    }
}



contract QTKNRegistration is ERC721,Ownable{
    uint256 private _currentTokenId = 0;//Token ID here will start from 1

     constructor() ERC721("QTKNRegistration", "QTKN") {}

    /**
     * Mints a token to an address with a tokenURI.
     * _to address of the future owner of the token
     */
    function mintTo(address _to) public onlyOwner {
        uint256 newTokenId = _getNextTokenId();
        _mint(_to, newTokenId);
        _incrementTokenId();
    }

    /**
     *  calculates the next token ID based on value of _currentTokenId
     *  uint256 for the next token ID
     */
    function _getNextTokenId() private view returns (uint256) {
        return _currentTokenId+1;
    }

    /**
     * increments the value of _currentTokenId
     */
    function _incrementTokenId() private {
        _currentTokenId++;
    }
}