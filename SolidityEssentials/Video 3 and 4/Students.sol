// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract School {
    // Several ways to initialize an array
    // Fixed sized array, all elements initialize to 0
    uint totalmarks = 0;
    string[] public students;
    struct Mark {
        uint x;
    }
    
    mapping(string=> Mark[]) studentMarks;
    

    function getstudentMarks(string memory name) public view returns (Mark[] memory ) {
         
        return studentMarks[name];
    }

    function addStudents(string memory _stu) public {
        bytes memory checkstu = bytes(_stu) ;
        if(checkstu.length != 0)
        students.push(_stu);
        else("Add a proper name Please");
    }
    
    function getAllStudents() public view returns (string[] memory) {
        return students;
    }
    function addMarks(string memory name , uint marks) public {
        // Append to array
        // This will increase the array length by 1.
        
        studentMarks[name].push(Mark(marks));
    }

         

    function getNumerOfStudents() public view returns (uint) {
        return students.length;
    }

    
    
}