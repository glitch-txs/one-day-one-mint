import { ethers } from "hardhat";
import { ArgType } from "./types";


//Add here your arguments for the constructor of your smart contract
const Args: ArgType = {
  mintStart: 0,
  mintEnd: 0,
  mintPrice: 0,
}

async function main() {

  const OneDayOneMint = await ethers.getContractFactory("OneDayOneMint");
  const oneDayOneMint = await OneDayOneMint.deploy(Args.mintStart, Args.mintEnd, Args.mintPrice);

  await oneDayOneMint.deployed();

  console.log("OneDayOneMint deployed to:", oneDayOneMint.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// to deploy on goerli run: npx hardhat run scripts/deploy.js --network goerli
//to deploy on any other network: npx hardhat run scripts/deploy.js --network <name of network>


