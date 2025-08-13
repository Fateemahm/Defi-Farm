# 🌾 Yield Harvest Protocol

> **Advanced DeFi Yield Farming Protocol with Enhanced Staking Rewards**

A modern, secure, and user-friendly decentralized finance (DeFi) application that implements yield farming and liquidity mining concepts. Users can stake DAI tokens to earn Harvest Reward Tokens (HRT) through our innovative staking mechanism.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Solidity](https://img.shields.io/badge/Solidity-^0.5.0-blue.svg)](https://solidity.readthedocs.io/)
[![React](https://img.shields.io/badge/React-16.8.4-blue.svg)](https://reactjs.org/)

## ✨ Features

- **🔒 Secure Staking**: Stake DAI tokens with enhanced security measures
- **💰 Reward System**: Earn HRT (Harvest Reward Tokens) as staking rewards
- **📊 Real-time Tracking**: Monitor your staking balance and rewards in real-time
- **🎨 Modern UI**: Clean, responsive interface with gradient design
- **⚡ Gas Optimized**: Efficient smart contracts with minimal gas consumption
- **🔔 Event Logging**: Comprehensive event system for tracking all transactions
- **🛡️ Enhanced Security**: Input validation and error handling throughout

## 🏗️ Architecture

This DApp follows a modern decentralized architecture:

- **Frontend**: React.js application with Web3 integration
- **Smart Contracts**: Solidity contracts deployed on Ethereum
- **Blockchain Interaction**: Web3.js for seamless blockchain communication
- **Wallet Integration**: MetaMask support for secure transactions

---

## 📚 How It Works

### Yield Farming Explained

Yield farming is a DeFi strategy where users provide liquidity to protocols in exchange for rewards. In our protocol:

1. **Stake DAI**: Users deposit DAI tokens into our smart contract
2. **Earn Rewards**: Receive HRT (Harvest Reward Tokens) as staking rewards
3. **Compound Growth**: Rewards can be reinvested for compound returns
4. **Flexible Withdrawal**: Unstake your tokens anytime

### Key Benefits

- **📈 Passive Income**: Earn rewards while holding your tokens
- **🔄 Liquidity**: Maintain access to your funds with flexible staking
- **🎯 Transparency**: All transactions are recorded on the blockchain
- **⚖️ Fair Distribution**: Rewards distributed proportionally to stake

## 🛠️ Smart Contracts

### TokenFarm.sol
The main staking contract that handles:
- Token staking and unstaking
- Reward calculation and distribution
- User balance tracking
- Event emission for transparency

### DappToken.sol (HRT)
The reward token contract featuring:
- ERC-20 standard compliance
- Harvest Reward Token (HRT) implementation
- Secure transfer mechanisms

### DaiToken.sol
Mock DAI token for testing and development purposes.

## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v12.18.3 or higher)
- **npm** or **yarn**
- **Git**
- **MetaMask** browser extension

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/yield-harvest-protocol.git
   cd yield-harvest-protocol
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Install Truffle globally**
   ```bash
   npm install -g truffle@5.1.39
   ```

4. **Install and setup Ganache**
   - Download from [Truffle Suite](https://www.trufflesuite.com/ganache)
   - Create a new workspace
   - Set RPC Server to `HTTP://127.0.0.1:7545`

### Development Setup

1. **Compile smart contracts**
   ```bash
   truffle compile
   ```

2. **Deploy contracts to local blockchain**
   ```bash
   truffle migrate --reset
   ```

3. **Run the frontend application**
   ```bash
   npm start
   ```

4. **Issue initial tokens (optional)**
   ```bash
   truffle exec scripts/issue-tokens.js
   ```

### MetaMask Configuration

1. Install MetaMask browser extension
2. Create or import a wallet
3. Connect to local network:
   - Network Name: `Ganache Local`
   - RPC URL: `http://127.0.0.1:7545`
   - Chain ID: `1337`
   - Currency Symbol: `ETH`

4. Import test accounts from Ganache using private keys

## 🧪 Testing

Run the test suite to ensure everything works correctly:

```bash
# Run all tests
truffle test

# Run specific test file
truffle test test/TokenFarm.test.js
```

## 📱 Usage

1. **Connect Wallet**: Click "Connect" to link your MetaMask wallet
2. **Stake Tokens**: Enter the amount of DAI you want to stake
3. **Earn Rewards**: Watch your HRT rewards accumulate over time
4. **Unstake**: Withdraw your staked DAI anytime
5. **Claim Rewards**: Collect your earned HRT tokens

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
MNEMONIC=your_wallet_mnemonic_here
INFURA_PROJECT_ID=your_infura_project_id
```

### Network Configuration

The project supports multiple networks. Update `truffle-config.js` for deployment to:
- Local development (Ganache)
- Ethereum testnets (Ropsten, Rinkeby, Goerli)
- Ethereum mainnet

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with inspiration from DeFi protocols and yield farming concepts
- Thanks to the Ethereum and DeFi community for continuous innovation
- Special thanks to Truffle Suite for excellent development tools

## 📞 Support

If you have any questions or need help, please:
- Open an issue on GitHub
- Check the documentation
- Join our community discussions

---

**⚠️ Disclaimer**: This is a demonstration project for educational purposes. Please conduct thorough testing and audits before using in production environments.
