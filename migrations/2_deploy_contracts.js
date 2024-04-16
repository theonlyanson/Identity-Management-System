const MyContract = artifacts.require("IdentityManagement");

module.exports = function (deployer) {
  deployer.deploy(MyContract);
};
