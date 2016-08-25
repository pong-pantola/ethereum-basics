//electionv2


contractAddress = 
"0x...CHANGE THIS TO YOUR CONTRACT'S ADDRESS"
;


contractInterface = 
[CHANGE THIS TO YOUR CONTRACT'S JSON INTERFACE]
;


contract = web3.eth.contract(contractInterface).at(contractAddress);


contract.Voted().watch(
  function(error, result){
    if (result.args.voter == web3.eth.accounts[0])
    alert("You successfully voted for candidate #"+result.args.candidate);
  }
);


contract.VotingError().watch(
  function(error, result){
    if (result.args.voter == web3.eth.accounts[0]){
      if (result.args.error == 777)
        alert("Voter voted already before.");
      else
      if (result.args.error == 888)
        alert("You voted for a non-candidate.");
    }
  }
);