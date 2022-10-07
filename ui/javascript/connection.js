// Web3 reference
// web3 = new Web3(new Web3.providers.HttpProvider(localhost));
web3 = new Web3(new Web3.providers.WebsocketProvider(localhost));

// check account balance
// web3.eth.getBalance(myAccountNumber).then(balance => console.log(balance))

// Build a reference to the smart contract
//var smartVotingContract = new web3.eth.Contract(abi);
const smartVotingContract = new web3.eth.Contract(abi, myContractNumber, {
    from: myAccountNumber,
    gasLimit: 5555000000,
    gasPrice: web3.utils.toWei('1.1', 'gwei')
  });

smartVotingContract.options.address = myContractNumber;

// Display contract info for confirmation
console.log(voting);
