const hre = require("hardhat");

async function Interact() {
  let contractAddress = "0x9C7d83595a5b8335556D2E8cf925eF012cCB9c3F";
  let node = process.env.nodeProvider;
  let walletKeys = process.env.privateWalletKey;
  let contractAbi = require('./contract.json');
  let etherscanPAI= process.env.etherneumApiKey

  const provider = new hre.ethers.JsonRpcProvider(node);
  const wallet = new hre.ethers.Wallet(walletKeys, provider);

  // Connect to the contract
  const helloContract = new hre.ethers.Contract(
    contractAddress,
    contractAbi,
    wallet
  );

  try {
    //
    const transaction = await helloContract.Message();
    const func = await helloContract.getMessage();

    console.log(func+"\n" ,transaction);
  } catch (error) {
    console.error("Error setting message:", error);

  }


  
}

Interact().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

