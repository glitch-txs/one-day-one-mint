# One Day One Mint

1. Run npm install

2. Modify the Smart Contract to your taste, add token name and the URI as well.

3. Create an .ENV file with an Alchemy KEY, you wallet private key, and an Etherscan key. This keys will be used in the hardhat.config.ts file. You can set the network where to smart contract will be deployed there.

To Deploy run on terminal: `npx hardhat run scripts/deploy.js --network <name of network>`
For etherscan verification please watch this awesome explanation: https://youtu.be/x1a5lrW-9fo?list=PLnSHr0dqnCcM3VqpsN3-TVmN1wHMLsjNs
