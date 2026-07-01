# Base B20 Token Project

A Foundry-based project for deploying B20 tokens on the Base network.

## Overview

This project demonstrates how to deploy a B20 token (ASSET variant) on Base using:
- **Base Foundry**: `base-forge` and `base-cast`
- **base-std**: Standard library for Base development
- **B20FactoryLib**: Factory library for creating B20 tokens

## Token Details

- **Name**: Zenorth
- **Symbol**: ZNRTH
- **Decimals**: 18
- **Supply Cap**: 1,000,000 tokens
- **Type**: ASSET

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git
- A Base network RPC URL (mainnet or testnet)
- Basescan API key (for verification)

## Setup

1. **Clone and install dependencies**:
   ```bash
   git clone https://github.com/zen0rth/base-b20-token.git
   cd base-b20-token
   forge install
   ```

2. **Configure environment**:
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Build the project**:
   ```bash
   forge build
   ```

## Deployment

### To Base Sepolia (Testnet)

```bash
forge script src/CreateToken.s.sol:CreateToken \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --broadcast \
  --verify \
  --etherscan-api-key $BASESCAN_API_KEY
```

### To Base Mainnet

```bash
forge script src/CreateToken.s.sol:CreateToken \
  --rpc-url $BASE_RPC_URL \
  --broadcast \
  --verify \
  --etherscan-api-key $BASESCAN_API_KEY
```

## Project Structure

```
├── foundry.toml           # Foundry configuration
├── .env.example           # Environment variables template
├── src/
│   └── CreateToken.s.sol  # Deployment script
└── README.md              # This file
```

## Key Features

- ✅ Configured for Base network
- ✅ Uses base-std library
- ✅ B20FactoryLib integration
- ✅ MINT_ROLE granted to deployer
- ✅ Full build verification
- ✅ No private keys in repository

## Building

```bash
forge build
```

This will compile all Solidity contracts and generate build artifacts in the `out/` directory.

## Security Considerations

- ⚠️ Never commit `.env` files with private keys
- ⚠️ Use environment variables for sensitive data
- ⚠️ Test on testnet before mainnet deployment
- ⚠️ Verify contract source code on Basescan

## Documentation

- [Base Documentation](https://docs.base.org/)
- [Foundry Book](https://book.getfoundry.sh/)
- [B20 Standard](https://base-org.github.io/b20/)

## License

MIT
