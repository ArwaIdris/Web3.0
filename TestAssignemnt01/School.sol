// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 

 contract School{

    struct course{
        string name;
        uint price;
    }
mapping(address=>course) public TeacherSubject;
address public teacher;
string public subject;
address owner;
uint public tshare;
uint public sshare;

constructor(){
    owner = msg.sender; //School

}
modifier onlyOwner(){
    require(msg.sender == owner);
    _;
}

function setTerms(uint teachershare, uint schoolshare) public onlyOwner{
tshare = teachershare;
sshare =schoolshare;
}

function calcprice(uint p , uint t,uint s ) pure public returns(uint){
    uint tax = ((( t * p)/100) + (( s * p)/100) ) * 3/100;
    uint schoolSh = (( s * p)/100);
    uint CoursePrice = p + tax + schoolSh;
    return CoursePrice;

}
function createCourse(string memory _name, uint _price) public {
    TeacherSubject[msg.sender].name = _name;
    TeacherSubject[msg.sender].price = _price;
    calcprice( _price,tshare, sshare);
    
       
}
function assigncourse(address _otherTeacher, string memory coursename) public{
// if (coursename == string  TeacherSubject[msg.sender].name) 
//this means that the teacher with this course already there is a the creator
TeacherSubject[_otherTeacher].name = coursename;
TeacherSubject[_otherTeacher].price = TeacherSubject[msg.sender].price;


}






 }