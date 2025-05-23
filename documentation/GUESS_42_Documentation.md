# GUESS_42 Project Documentation

## Overview

**GUESS_42** is a smart contract-based guessing game deployed on the Binance Smart Chain (BSC) Testnet. Players request to participate, get approved by the contract owner, and then try to guess a secret number to win token rewards.

---

## Technologies Used

- **Solidity**: For writing the smart contract (`GuessToken_42.sol`).
- **Truffle**: For compiling, deploying, and testing smart contracts.
- **Node.js**: For running Truffle and related scripts.
- **@truffle/hdwallet-provider**: For managing wallet keys and deploying to BSC Testnet.
- **dotenv**: For managing environment variables (private keys, RPC URLs).
- **Binance Smart Chain Testnet**: As the blockchain network for deployment.
- **MetaMask**: For managing accounts and interacting with the deployed contract via a web browser

---

## Features

- ERC20-like token with custom logic.
- Players must request to play and be approved by the owner.
- Approved players can guess the secret number.
- Winners receive a token reward.
- Owner controls approvals and initial token supply.

---

## How It Works

1. **Deployment**: The contract is deployed with an initial token supply and a secret number.
2. **Request to Play**: Players call `requestToPlay()` to signal interest.
3. **Approval**: The owner approves players using `approvePlayer(address)`.
4. **Guessing**: Approved players call `guessNumber(uint256)` to try their luck.
5. **Reward**: If the guess is correct, the player receives tokens.

---

## How to Use
- Interact with it directly via MetaMask
- Or to guess a number via truffle console:
1. truffle console --config truffle-config.bsc.js --network bscTestnet
2. const accounts = await web3.eth.getAccounts();
3. list all the accounts: accounts
4. const instance = await GuessToken_42.deployed();
5. try to play: await instance.guessNumber(YOUR_NBR, { from: accounts[1] });
6. request to play: await instance.requestToPlay({ from: accounts[1] });
7. approve player to play: await instance.approvePlayer(accounts[1], { from: accounts[0] });
8. try to play: await instance.guessNumber(YOUR_NBR, { from: accounts[1] });
9. .exit


### Check information about the deployed contract by it's address
- https://testnet.bscscan.com/

### Prerequisites

- Node.js and npm installed
- Truffle installed globally (`npm install -g truffle`)
- BSC Testnet account and private key
- BSC Testnet RPC endpoint
- MetaMask browser extension installed and configured for BSC Testnet

### Setup

1. **Clone the repository** and install dependencies:
    ```sh
    npm install
    ```

2. **Configure environment variables** in a `.env` file:
    ```
    MNEMONIC=your_private_key
    ```

3. **Compile the contract**:
    ```sh
    truffle compile --config truffle-config.bsc.js
    ```

4. **Deploy to BSC Testnet**:
    ```sh
    truffle migrate --config truffle-config.bsc.js --network bscTestnet
    ```

### Interacting with the Contract

1. **Open Truffle console**:
    ```sh
    truffle console --config truffle-config.bsc.js --network bscTestnet
    ```

2. **Get contract instance**:
    ```js
    const instance = await GuessToken_42.deployed();
    const accounts = await web3.eth.getAccounts();
    ```

3. **Player requests to play**:
    ```js
    await instance.requestToPlay({ from: accounts[1] });
    ```

4. **Owner approves player**:
    ```js
    await instance.approvePlayer(accounts[1], { from: accounts[0] });
    ```

5. **Player makes a guess**:
    ```js
    await instance.guessNumber(42, { from: accounts[1] });
    ```

---

## Notes

- Only approved players can guess.
- The owner must have enough tokens to reward winners.
- The secret number is set at deployment and cannot be changed.

---

## License

MIT
//compilation
//truffle compile contracts/bsc/GuessToken_42.sol
//truffle migrate --f 4 --to 4 --config truffle-config.bsc.js --network bscTestnet
//enter console
// truffle console --config truffle-config.bsc.js --network bscTestnet
//const instance = await GuessToken_42.deployed();
//await instance.guessNumber(42, { from: "0xYourCustomAddress" });
// displays all addresses : await web3.eth.getAccounts()
//await instance.requestToPlay({ from: accounts[1] });
//await instance.approvePlayer(accounts[1], { from: accounts[0] });

//set up owner variable: const owner = await instance.owner();
//list of all accounts: const accounts = await web3.eth.getAccounts(); accounts
//guessing number: await instance.guessNumber(42, { from: accounts[1] });
//.exit



//1. truffle console --config truffle-config.bsc.js --network bscTestnet
//2. const accounts = await web3.eth.getAccounts();
//3. list all the accounts: accounts
//4. const instance = await GuessToken_42.deployed();
//5. try to play: await instance.guessNumber(42, { from: accounts[1] });
//6. request to play: await instance.requestToPlay({ from: accounts[1] });
//7. approve player to play: await instance.approvePlayer(accounts[1], { from: accounts[0] });
//8. try to play: await instance.guessNumber(42, { from: accounts[1] });