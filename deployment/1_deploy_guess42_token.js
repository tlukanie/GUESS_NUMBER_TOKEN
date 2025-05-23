const GuessToken_42 = artifacts.require("GuessToken_42");

module.exports = function (deployer) {
  const initialSupply = 1000000; // 1,000,000 tokens
  const secretNumber = 42;       // The number to guess
  deployer.deploy(GuessToken_42, initialSupply, secretNumber);
};
