

import { ethers } from "hardhat";
import {  School,School__factory , QTKN__factory,QTKN} from "../typechain-types";


async function main() {
    const [OwnerSchool,student1,student2,EnGTeacher,Ecoteacher] =await ethers.getSigners();
    const price =ethers.utils.parseEther("2") ;
    const pay =ethers.utils.parseEther("1.29") ;

  // const MyToken:MyToken__factory = await ethers.getContractFactory("MyToken");
  // const s:MyToken = await MyToken.deploy();
  // await s.deployed();

  const School:School__factory = await ethers.getContractFactory("School");
  const s:School = await School.deploy();
  await s.deployed();

  // const QTKN:QTKN__factory = await ethers.getContractFactory("QTKN");
  // const s:QTKN = await QTKN.deploy();
  // await s.deployed();



  
//   console.log("/*************************************************************************/");
//   console.log("TOKEN DETAILS");
//   console.log("/*************************************************************************/");
//  console.log("name  of token is = ", await s.name());
// console.log("name of symbol is =", await s.symbol());
// console.log("decimals = ", await s.decimals());
// console.log("total supply amount is =", await s.totalSupply());

console.log("/*************************************************************************/");
console.log("BUYING TOKENS BY STUDENT1 EXAMPLE ")
console.log("/*************************************************************************/");

 console.log("name  of token is = ", await s.symbol());
 console.log("amount of School   is ", await (await s.balanceOf(OwnerSchool.address)).toString());
console.log("amount of TOKEN OF student1 are=  ", await (await s.balanceOf(student1.address)).toString());
//await s.transfer(student1.address,100);
(await s.connect(student1).mint(200,{value:price})).wait();
 //(await s.mint(200,{value:price})).wait();
console.log("amount of student1 after transfer  is ", (await (await s.balanceOf(student1.address)).toString()));
console.log("amount of school after transfer  is ", await (await s.balanceOf(OwnerSchool.address)).toString());


console.log("/*************************************************************************/");
console.log("sCHOOL ENGLISH AND ECO TEACHERS CREATING COURSES")
console.log("/*************************************************************************/");

  console.log("school address is  = ", s.address);
  await s.setTerms(80, 20);
  const  txt1 =  await s.connect(EnGTeacher).createCourse(2001,"Eng", 101, 3600);
  const  txt2 =  await s.connect(Ecoteacher).createCourse(3001,"Eco", 150, 3600);
  //console.log("total price of course come to ", await s.idToCourse(2001));
  console.log("/*************************************************************************/");
  console.log("ENGLISH TEACHER DETAILS");
  console.log("/*************************************************************************/");
  await s.calcprice(2001);
console.log("add3 2001 course Teacher address = ", EnGTeacher.address);
console.log("2001 subject belong to this teacher", await s.SubjectsOfTeacher(2001));
console.log("2001 teacher share is ", await  s.teacherprice());
console.log("2001 school share is  ", await  s.schoolprice());
console.log("2001 course price calculated is ", await  s.coursetotalAmt());
console.log("2001 course price calculated after adding tax is ", await  s.CoursePrice());
// console.log("/*************************************************************************/");
// console.log("ECO TEACHER DETAILS");
//   console.log("/*************************************************************************/");
//   await s.calcprice(3001);
//   console.log("add4 3001 course Teacher address = ", Ecoteacher.address);
// console.log("3001 subject belong to this teacher", await s.SubjectsOfTeacher(3001));
// console.log("3001 teacher share is ", await  s.teacherprice());
// console.log("3001 school share is  ", await  s.schoolprice());
// console.log("3001 course price calculated is ", await  s.coursetotalAmt());
// console.log("3001 course price calculated after adding tax is ", await  s.CoursePrice());

// console.log("/*************************************************************************/");
// console.log("ENROLLING FOR COURSE AND PAYING THE REQUIRED PRICE);
//   console.log("/*************************************************************************/");
//console.log("Course details", await s.idToCourse(2001));
(await s.connect(student1).enroll(2001,{value:pay})).wait();

console.log("amount of student1 after transfer  is ", (await (await s.balanceOf(student1.address)).toString()));
console.log("amount of school after transfer  is ", await (await s.balanceOf(OwnerSchool.address)).toString());
console.log("amount of eng teacher after transfer  is ", await (await s.balanceOf(EnGTeacher.address)).toString());




 /********************************************************************************************* *//*
  console.log("Total supply created and assigned to Owner: ", s.address, (await s.totalSupply()).toString());
  console.log("total supply ",(await s.totalSupply()).toString());

  console.log("The address: owner has total balance of ", (await s.balanceOf(own.address)).toString());
  console.log("The address: add1 has balance of ", (await s.balanceOf(add1.address)).toString());
  await s.transfer(add1.address, 300);
  console.log("After transfer The address: now add1 has balance of ",(await  s.balanceOf(add1.address)).toString());
  console.log("After transfer The address: owner has total balance of ", (await s.balanceOf(own.address)).toString());

  console.log("The address: add2 has total balance of ", (await s.balanceOf(add2.address)).toString());
  await s.approve(add2.address, 100);

  console.log("after delegation The address: add2 has total balance of ", (await s.allowance(own.address, add2.address)).toString());
  console.log("The address: add1 has balance of ", (await s.balanceOf(add1.address)).toString());

  console.log("after delegation The address: add2 can transfer the token to add1 address ");
  await s.connect(add2).transferFrom(own.address , add1.address ,50);
  console.log("After transfer The address: now add1 has balance of ",(await  s.balanceOf(add1.address)).toString());
  console.log("after transfer The address: add2 has total balance of ", (await s.allowance(own.address, add2.address)).toString());


*/

  //setTerms(uint teachershare, uint schoolshare)


 
  // console.log("Total supply created and assigned to Owner: ", s.totalSupply_);
  // console.log("total supply ",await (await s.totalSupply()).toString());

  // console.log("The address: owner has total balance of ", (await s.balanceOf(own.address)).toString());
  // console.log("The address: add1 has balance of ", (await s.balanceOf(add1.address)).toString());
  // await s.transfer(add1.address, 300);
  // console.log("After transfer The address: now add1 has balance of ",(await  s.balanceOf(add1.address)).toString());
  // console.log("After transfer The address: owner has total balance of ", (await s.balanceOf(own.address)).toString());

  // console.log("The address: add2 has total balance of ", (await s.balanceOf(add2.address)).toString());
  // await s.approve(add2.address, 100);

  // console.log("after delegation The address: add2 has total balance of ", (await s.allowance(own.address, add2.address)).toString());
  // console.log("The address: add1 has balance of ", (await s.balanceOf(add1.address)).toString());

  // console.log("after delegation The address: add2 can transfer the token to add1 address ");
  // await s.connect(add2).transferFrom(own.address , add1.address ,50);
  // console.log("After transfer The address: now add1 has balance of ",(await  s.balanceOf(add1.address)).toString());
  // console.log("after transfer The address: add2 has total balance of ", (await s.allowance(own.address, add2.address)).toString());



}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
