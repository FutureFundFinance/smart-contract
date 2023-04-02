import { HardhatUserConfig } from "hardhat/config";
require("dotenv").config();

import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai: {
      url: process.env.STAGING_ALCHEMY_KEY,
      accounts: [process.env.PRIVATE_KEY ?? ''],
    }
  }
};

export default config;
