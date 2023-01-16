import { ethers } from "hardhat";
import { FallbackFunctions, FallbackFunctions__factory } from "../typechain-types";

async function main() {

  const [owner,addr1,addr2]=await ethers.getSigners();

    console.log("owner address= ",owner.address);
    console.log("addr1 address= ",addr1.address);
   
  const FallbackFunctions:FallbackFunctions__factory = await ethers.getContractFactory("FallbackFunctions");
   const e:FallbackFunctions = await FallbackFunctions.deploy();
   console.log("e.address= ", e.address);
   await e.deployed();

   console.log("FallbackFunctions deployed to ", e.address);
   console.log("Balance of contract", await (await ethers.provider.getBalance(e.address)).toString());
   
   console.log("REceive counter = ", (await e.countReceive()).toString()) ;
   console.log("counter Fallback = ", (await e.countFallback()).toString()) ;
   console.log("Receive balance = ", (await e.receiveBalance(addr1.address)).toString()) ;
   console.log("Fallback Balance = ", (await e.fallbackBalance(addr1.address)).toString());
   // this function will transfer ether from add1 to owner address which is the contract owner address
   const txt1 = await addr1.sendTransaction({
        to: e.address,
        value: ethers.utils.parseEther("1")
    })
    console.log("********************************");
    console.log("Balance of contract", await ethers.provider.getBalance(e.address));
   
   console.log("REceive counter = ", (await e.countReceive()).toString()) ;
   console.log("counter Fallback = ", (await e.countFallback()).toString()) ;
   console.log("Receive balance = ", (await e.receiveBalance(addr1.address)).toString()) ;
   console.log("Fallback Balance = ",(await e.fallbackBalance(addr1.address)).toString());
   console.log("Ethers sent to contract address = ",(await ethers.provider.getBalance(e.address)).toString());

}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


