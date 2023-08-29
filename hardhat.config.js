require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.10",
  networks: {
    sepolia: {
      url: process.env.nodeProvider,
      accounts: [process.env.privateWalletKey],
    },
  },
  etherscan: {
    apiKey: process.env.etherneumApiKey,
  },
};
