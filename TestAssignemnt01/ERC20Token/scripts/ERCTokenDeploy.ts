import { ethers } from "hardhat";
import { FirstCoin__factory,FirstCoin } from "../typechain-types";


async function main() {
    const [own,add1,add2] =await ethers.getSigners();
  
  const FirstCoin:FirstCoin__factory = await ethers.getContractFactory("FirstCoin");
  const ef:FirstCoin = await FirstCoin.deploy(1000);

  await ef.deployed();


 
  console.log("Total supply created and assigned to Owner: ", ef.totalSupply_);
  console.log("total supply ",await (await ef.totalSupply()).toString());

  console.log("The address: owner has total balance of ", (await ef.balanceOf(own.address)).toString());
  console.log("The address: add1 has balance of ", (await ef.balanceOf(add1.address)).toString());
  await ef.transfer(add1.address, 300);
  console.log("After transfer The address: now add1 has balance of ",(await  ef.balanceOf(add1.address)).toString());
  console.log("After transfer The address: owner has total balance of ", (await ef.balanceOf(own.address)).toString());

  console.log("The address: add2 has total balance of ", (await ef.balanceOf(add2.address)).toString());
  await ef.approve(add2.address, 100);

  console.log("after delegation The address: add2 has total balance of ", (await ef.allowance(own.address, add2.address)).toString());
  console.log("The address: add1 has balance of ", (await ef.balanceOf(add1.address)).toString());

  console.log("after delegation The address: add2 can transfer the token to add1 address ");
  await ef.connect(add2).transferFrom(own.address , add1.address ,50);
  console.log("After transfer The address: now add1 has balance of ",(await  ef.balanceOf(add1.address)).toString());
  console.log("after transfer The address: add2 has total balance of ", (await ef.allowance(own.address, add2.address)).toString());

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
