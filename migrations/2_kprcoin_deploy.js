let KPRCoin = artifacts.require("./KPRCoin.sol");  
  
module.exports = function(deployer) {  
  deployer.deploy(KPRCoin);  
};

