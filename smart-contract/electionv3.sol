pragma solidity 0.4.8;

contract ElectionV3{

  uint public rVoteCount;
  uint public gVoteCount;
  uint public bVoteCount; 

  mapping (address => uint) ballot;

  uint deadline;

  event Voted(address voter, uint candidate);
  event VotingError(address voter, uint error);

  event GetResult(address requester, uint rVoteCount, uint gVoteCount, uint bVoteCount);
  event NoResultYet(address requester);


  function ElectionV3(uint durationInMinutes){
    deadline = now + durationInMinutes * 1 minutes;

    rVoteCount = 0;
    gVoteCount = 0;
    bVoteCount = 0;
  }


  //Mr. Red = 1
  //Mr. Green = 2
  //Mr. Blue = 3
  function vote(uint candidate){
    if (now >= deadline){//election is closed
      VotingError(msg.sender, 999);
      return;
    }

    if (ballot[msg.sender] != 0){//voter voted already
      VotingError(msg.sender, 777);
      return;
    }

    if (candidate == 1)//for Mr. Red
      rVoteCount++;
    else 
    if (candidate == 2)//for Mr. Green
      gVoteCount++;
    else 
    if (candidate == 3)//for Mr. Blue
      bVoteCount++;
    else{//wrong candidate number
      VotingError(msg.sender, 888);
      return;
    }

    ballot[msg.sender] = candidate;
    Voted(msg.sender, candidate);

  }


  function requestResult(){
    if (now < deadline)
      NoResultYet(msg.sender);
    else
      GetResult(msg.sender, rVoteCount, gVoteCount, bVoteCount);
  } 

}
