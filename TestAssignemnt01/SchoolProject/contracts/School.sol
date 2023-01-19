// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "contracts/QTKN.sol";

 contract School is QTKN{

    address public schoolAddress;
    uint public i = 1;
    uint public baseprice = 100;
    uint public teacherprice;
    uint public coursetotalAmt;
    uint public schoolprice;
    uint public CoursePrice;
    address public teacher;
    string public subject;
    address owner;
    uint public tshare;
    uint public sshare;

    struct course{
        uint id;
        string name;
        uint price;
        uint TotalPrice;
        uint courseTime;
        bool listed;
        address[] students;
    }
uint public courseID ;

//mapping(address=>course) public TeacherSubject;

mapping(uint=>address) public SubjectsOfTeacher;
mapping(uint=>course) public idToCourse;
mapping(address=>uint) public studenttokens;



constructor(){
    owner = msg.sender; //School

}
modifier onlyOwner(){
    require(msg.sender == owner);
    _;
}

function mint(uint256 _amount) public payable {
        require(msg.value == (_amount * 0.01 ether),"Value sent is not sufficient");
        _mint(msg.sender, _amount);
    }

function setTerms(uint teachershare, uint schoolshare) public onlyOwner{
tshare = teachershare;
sshare =schoolshare;
schoolAddress = msg.sender;
}
function enroll(uint _id) public payable {
    require(msg.value >= idToCourse[_id].TotalPrice,"The price of course is not suffiecient");
//idToCourse[_id].students[i++] = msg.sender;

transfer(schoolAddress,(idToCourse[_id].TotalPrice-idToCourse[_id].price));
transfer(SubjectsOfTeacher[_id],idToCourse[_id].price);
}

function calcprice(uint _id)  public returns(uint){
    teacherprice = idToCourse[_id].price ;
     coursetotalAmt = (teacherprice*100)/tshare;
    schoolprice = coursetotalAmt - teacherprice;
    uint tax = (coursetotalAmt  * 3)/100;
   
    CoursePrice = teacherprice + tax + schoolprice;
    return CoursePrice;

}
function createCourse(uint _id,string memory _name, uint _price, uint _time) public {
    require(_price > baseprice,"Price of course should be greater than 100");
    SubjectsOfTeacher[_id] = msg.sender;
    idToCourse[_id].id = _id;
    idToCourse[_id].name = _name;
    idToCourse[_id].price = _price;
    idToCourse[_id].courseTime = block.timestamp + _time;
    idToCourse[_id].TotalPrice = calcprice(_id);
    idToCourse[_id].listed = true;
       
    
    
       
}
function assigncourse(address _otherTeacher, uint courseid) public{
 require(SubjectsOfTeacher[courseid] == msg.sender) ;
//this means that the teacher has this course with her
// now she changed the course to other teachers address
SubjectsOfTeacher[courseid] = _otherTeacher;



}






 }