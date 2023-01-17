// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 

 
contract FirstCoin  {

    string public constant name = "QTKN";
    string public constant symbol = "QTKN";
    uint8 public constant decimals = 18;  


    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    mapping(address => uint256) private balances;
    mapping(address => mapping (address => uint256)) private allowed;
    uint256 public totalSupply_;
    address private owner_; 

    constructor(uint256 total) {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
        owner_ = msg.sender;
       
    }

    function owner() public view returns (address){
        return owner_;
    }

    function totalSupply() public view returns (uint256) {
       
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint) {
       
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender], "Not enough tokens.");
        balances[msg.sender] = balances[msg.sender] - numTokens;
        balances[receiver] = balances[receiver] + numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
 
        return true;
    }

    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        //console.log("The owner: '%s' has has approved '%s' tokens to delegate '%s'", msg.sender, numTokens, delegate);
        return true;
    }


    function allowance(address tokenowner, address delegate) public view returns (uint) {
        //console.log("The owner: '%s' has approved '%s' tokens for the delegate '%s'", tokenowner, allowed[tokenowner][delegate], delegate);
        return allowed[tokenowner][delegate];
    }

    function transferFrom(address ownerAddr, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[ownerAddr]);
        require(numTokens <= allowed[ownerAddr][msg.sender]);
        balances[ownerAddr] = balances[ownerAddr] - numTokens;
        allowed[ownerAddr][msg.sender] = allowed[ownerAddr][msg.sender] - numTokens;
        balances[buyer] = balances[buyer] + numTokens;
        emit Transfer(ownerAddr, buyer, numTokens);
        //console.log("With owners: '%s' permission delegate '%s' is transfering '%s' tokens to the buyer", ownerAddr, msg.sender, numTokens);
        return true;
    }


}