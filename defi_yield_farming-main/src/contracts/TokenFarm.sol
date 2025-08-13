pragma solidity ^0.5.0;

import "./DappToken.sol";
import "./DaiToken.sol";

contract TokenFarm {
	string public name = "Yield Harvest Protocol";
	address public owner;
	DappToken public dappToken;
	DaiToken public daiToken;

	address[] public stakers;
	mapping(address => uint) public stakingBalance;
	mapping(address => bool) public hasStaked;
	mapping(address => bool) public isStaking;
	mapping(address => uint) public stakingTimestamp;

	// Events for better tracking
	event TokensStaked(address indexed user, uint256 amount, uint256 timestamp);
	event TokensUnstaked(address indexed user, uint256 amount, uint256 timestamp);
	event RewardsIssued(address indexed user, uint256 amount, uint256 timestamp);

	constructor(DappToken _dappToken, DaiToken _daiToken) public {
		dappToken = _dappToken;
		daiToken = _daiToken;
		owner = msg.sender;
	}

	/* Stakes Tokens (Deposit): An investor will deposit the DAI into the smart contracts
	to starting earning rewards.

	Core Thing: Transfer the DAI tokens from the investor's wallet to this smart contract. */
	function stakeTokens(uint _amount) public {
		// Require amount greater than 0
		require(_amount > 0, "Amount must be greater than 0");

		// Check user has sufficient balance
		require(daiToken.balanceOf(msg.sender) >= _amount, "Insufficient DAI balance");

		// transfer Mock DAI tokens to this contract for staking
		daiToken.transferFrom(msg.sender, address(this), _amount);

		// update staking balance
		stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

		// Record staking timestamp
		stakingTimestamp[msg.sender] = block.timestamp;

		// add user to stakers array *only* if they haven't staked already
		if(!hasStaked[msg.sender]) {
			stakers.push(msg.sender);
		}

		// update staking status
		isStaking[msg.sender] = true;
		hasStaked[msg.sender] = true;

		// Emit event
		emit TokensStaked(msg.sender, _amount, block.timestamp);
	}

	// Unstaking Tokens (Withdraw): Withdraw money from DApp.
	function unstakeTokens() public {
		// fetch staking balance
		uint balance = stakingBalance[msg.sender];

		// require amount greater than 0
		require(balance > 0, "No tokens staked");
		require(isStaking[msg.sender], "Not currently staking");

		// transfer Mock Dai tokens back to user
		daiToken.transfer(msg.sender, balance);

		// reset staking balance and timestamp
		stakingBalance[msg.sender] = 0;
		stakingTimestamp[msg.sender] = 0;

		// update staking status
		isStaking[msg.sender] = false;

		// Emit event
		emit TokensUnstaked(msg.sender, balance, block.timestamp);
	}

	/* Issuing Tokens: Earning interest which is issuing tokens for people who stake them.

	Core Thing: Distribute DApp tokens as interest and also allow the investor to unstake their tokens
	from the app so give them interest using the app. */
	function issueTokens() public {
		// only owner can call this function
		require(msg.sender == owner, "Only owner can issue tokens");

		// issue tokens to all stakers
		for (uint i=0; i<stakers.length; i++) {
			address recipient = stakers[i];
			uint balance = stakingBalance[recipient];
			if(balance > 0 && isStaking[recipient]) {
				// Issue 1:1 ratio of reward tokens
				dappToken.transfer(recipient, balance);

				// Emit reward event
				emit RewardsIssued(recipient, balance, block.timestamp);
			}
		}
	}

	// Get staking info for a user
	function getStakingInfo(address _user) public view returns (uint256 balance, uint256 timestamp, bool staking) {
		return (stakingBalance[_user], stakingTimestamp[_user], isStaking[_user]);
	}

}