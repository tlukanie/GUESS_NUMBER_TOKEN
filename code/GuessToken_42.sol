// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GuessToken_42 {
    string public name = "Guess_42";
    string public symbol = "GSS42";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => bool) public playRequests; // Tracks client requests
    mapping(address => bool) public approvedPlayers; // Tracks owner approvals

    uint256 private secretNumber;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Winner(address indexed player, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(uint256 initialSupply, uint256 _secretNumber) {
        owner = msg.sender;
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[owner] = totalSupply;
        secretNumber = _secretNumber;
        emit Transfer(address(0), owner, totalSupply);
    }

    function requestToPlay() public {
        playRequests[msg.sender] = true;
    }

    function approvePlayer(address player) public onlyOwner {
        require(playRequests[player], "Player must request first");
        approvedPlayers[player] = true;
    }

    function guessNumber(uint256 guess) public {
        require(approvedPlayers[msg.sender], "Not approved to play");
        uint256 rewardAmount = 42 * 10 ** uint256(decimals);
        require(balanceOf[owner] >= rewardAmount, "Not enough tokens for reward");
        if (guess == secretNumber) {
            balanceOf[owner] -= rewardAmount;
            balanceOf[msg.sender] += rewardAmount;
            emit Transfer(owner, msg.sender, rewardAmount);
            emit Winner(msg.sender, rewardAmount);
            // reset approval so player must request again for next round
            approvedPlayers[msg.sender] = false;
            playRequests[msg.sender] = false;
        }
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Allowance exceeded");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
}