pragma solidity 0.4.8;

contract ElectionV1{

  uint public rVoteCount;
  uint public gVoteCount;
  uint public bVoteCount; 


  function ElectionV1(){
    rVoteCount = 0;
    gVoteCount = 0;
    bVoteCount = 0;
  }


  //Mr. Red = 1
  //Mr. Green = 2
  //Mr. Blue = 3
  function vote(uint candidate){
    if (candidate == 1)//for Mr. Red
      rVoteCount++;
    else 
    if (candidate == 2)//for Mr. Green
      gVoteCount++;
    else 
    if (candidate == 3)//for Mr. Blue
      bVoteCount++;
  }

}
