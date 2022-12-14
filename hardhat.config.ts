import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: [`${process.env.GOERLI_PRIVATE_KEY}`]
    }
  },
  etherscan: {
    apiKey: `${process.env.ETHERSCAN_PRIVATE_API_KEY}`
  }
};

export default config;


// How to verify your smart contract on Etherscan: https://youtu.be/x1a5lrW-9fo?list=PLnSHr0dqnCcM3VqpsN3-TVmN1wHMLsjNs