const HDWalletProvider = require("@truffle/hdwallet-provider");

// Update the following with your actual mnemonic phrase and Infura project ID
const mnemonic =
  "old vault cause this mind lava clean inmate tired cake ceiling snack";
const projectId = "b8508d7e341e421796e736c56b7223eb";

module.exports = {
  networks: {
    amoy: {
      host: "https://rpc-amoy.polygon.technology",
      port: 80002,
      network_id: 80002, // Polygon Amoy testnet ID
      gas: 7999950,
      gasPrice: 10000000000, // Adjust gas price if needed
    },
    // Add more networks for other environments like mainnet, kovan, etc.
  },
  // Set default mocha options here, use special reporters, etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.19", // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    },
  },
};
