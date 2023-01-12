// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract PurchaseDpt {
   address public InventoryManager;
   mapping(address=> uint) public StockBal;

   constructor() {
      InventoryManager = msg.sender;
      StockBal[address(this)] = 100;
   }
   modifier onlyOwner(){
      require(msg.sender == InventoryManager, "Not Owner");
      _; 
   }
   
   function getBalance() public view returns (uint) {
      return StockBal[address(this)];
   }

   function reStock(uint amount) public onlyOwner{
      StockBal[address(this)] += amount;
   }

   function purchase(uint amount) public payable {
      require(msg.value >= amount * 2 ether,"You must pay at least 2 Ether per product" );
      require(StockBal[address(this)] >= amount,"Not Enough products in Stock to fulfill request");
      StockBal[address(this)] -= amount;
      StockBal[msg.sender] += amount;
   }

}