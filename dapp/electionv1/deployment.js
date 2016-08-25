//electionv1


contractAddress = 
"0x...CHANGE THIS TO YOUR CONTRACT'S ADDRESS"
;


contractInterface = 
[CHANGE THIS TO YOUR CONTRACT'S JSON INTERFACE]
;


contract = web3.eth.contract(contractInterface).at(contractAddress);

