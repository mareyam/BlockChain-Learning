// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Owner {
   address owner;
   constructor() public {
      owner = msg.sender;
   }
   modifier accessOwner {
      require(msg.sender == owner);
      _;
   }
   modifier costsCalculated(uint price) {
      if (msg.value >= price) {
         _;
      }
   }
}
contract Register is Owner {
   mapping (address => bool) addressesReg;
   uint cost;
   constructor(uint initialCost) public { cost = initialCost; }
   
   function register() public payable costs(cost) {
      addressesReg[msg.sender] = true;
   }
   function changePrice(uint _cost) public onlyOwner {
      cost = _cost;
   }
}
