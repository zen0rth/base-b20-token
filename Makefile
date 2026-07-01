.PHONY: help install build clean test deploy-testnet deploy-mainnet

help:
	@echo "Base B20 Token Project"
	@echo ""
	@echo "Available commands:"
	@echo "  make install         - Install dependencies"
	@echo "  make build           - Build the project"
	@echo "  make clean           - Clean build artifacts"
	@echo "  make test            - Run tests"
	@echo "  make deploy-testnet  - Deploy to Base Sepolia"
	@echo "  make deploy-mainnet  - Deploy to Base Mainnet"

install:
	forge install

build:
	forge build

clean:
	forge clean

test:
	forge test

deploy-testnet:
	@echo "Deploying to Base Sepolia..."
	forge script src/CreateToken.s.sol:CreateToken \
		--rpc-url $${BASE_SEPOLIA_RPC_URL} \
		--broadcast \
		--verify \
		--etherscan-api-key $${BASESCAN_API_KEY}

deploy-mainnet:
	@echo "Deploying to Base Mainnet..."
	forge script src/CreateToken.s.sol:CreateToken \
		--rpc-url $${BASE_RPC_URL} \
		--broadcast \
		--verify \
		--etherscan-api-key $${BASESCAN_API_KEY}
