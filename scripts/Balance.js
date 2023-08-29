const hre = require("hardhat");
require("dotenv").config(); 

let node = process.env.nodeProvider; 
let contractAdress="0xBA9a2354a82Eb9e1880310f778959B2818b0b643"; 
let contractAbi = require('./contract.json'); 
let wallet= process.env.privateWalletKey; 


async function main() {

//Checking the Balance of the contract 

const provider = new hre.ethers.JsonRpcProvider(node); 
const PrivateWallet = new hre.ethers.Wallet(wallet,provider); 


const Dexcontract = new hre.ethers.Contract(
    contractAbi, 
    PrivateWallet,
    contractAdress

)


    //Deposit Money in the contract
    const depositMoney = await Dexcontract.depositDAI(100000000);





}



main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
