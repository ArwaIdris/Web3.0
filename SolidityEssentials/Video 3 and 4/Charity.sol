// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;



contract Charity{
    mapping(address=>uint) public contributors;
    address public manager;
    uint public minimumContribution;
    uint public deadline;
    uint public target;
    uint public raisedamount;
    uint public noOfContributors;

    struct requestForCharity{
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint noOFVoters;
        mapping(address=>bool) voters;

    }

    mapping(uint=>requestForCharity) public requests;
    uint public numRequests;

    constructor(uint _target, uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        minimumContribution = 100 wei;
        manager = msg.sender;
    }

    function sendEth() public payable{
        require(block.timestamp < deadline,"Deadline has passed");
        require(msg.value >= minimumContribution,"Minimum contribution is not met");
        if(contributors[msg.sender]==0){
            noOfContributors++;
        }
        contributors[msg.sender] += msg.value;
        raisedamount +=msg.value;
    }

    function getCharityBal() public view returns(uint){
        return address(this).balance;
    }

    function refund() public{
        require(block.timestamp >deadline && raisedamount <target,"You are not eligible for refund");
        require(contributors[msg.sender] > 0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0;
    }

    modifier onlyManager(){
        require(msg.sender == manager,"Only manager can call this function");
        _;
    }

    function createRequests(string memory _description, address payable _recipient,uint _value) public onlyManager
    {// struct with mapping in it, makes use of only storage if wanting to be used in a function
        requestForCharity storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
        newRequest.noOFVoters = 0;

    }
    function voteRequestCharity(uint _requestno) public {
        require(contributors[msg.sender]>0,"you must be a contributor");
        requestForCharity storage thisrequest = requests[_requestno];
        require(thisrequest.voters[msg.sender] ==false,"You have already voted");
        thisrequest.voters[msg.sender] = true;
        thisrequest.noOFVoters++;

    }

    function makePaymentComplete(uint _requestno) public  onlyManager {
        require(raisedamount >= target);
        requestForCharity storage thisrequest = requests[_requestno];
        require(thisrequest.completed == false,"This request has been completed");
        require(thisrequest.noOFVoters > noOfContributors/2,"Majority does not support");
        thisrequest.recipient.transfer(thisrequest.value);
        thisrequest.completed = true;

    }
    
    }
