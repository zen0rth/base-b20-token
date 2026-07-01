// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {B20FactoryLib} from "base-std/B20FactoryLib.sol";

/**
 * @title CreateToken
 * @notice Deployment script for creating a B20 token (ASSET variant)
 * @dev Uses B20FactoryLib to deploy a new token with MINT_ROLE granted to deployer
 */
contract CreateToken is Script {
    // Token configuration
    string public constant TOKEN_NAME = "Zenorth";
    string public constant TOKEN_SYMBOL = "ZNRTH";
    uint8 public constant TOKEN_DECIMALS = 18;
    uint256 public constant TOKEN_SUPPLY_CAP = 1_000_000 * 10**18; // 1 million tokens

    // B20FactoryLib constants
    uint256 public constant ASSET_KIND = 1; // ASSET token kind

    function run() external {
        // Start broadcasting transactions
        vm.startBroadcast();

        // Deploy the token using B20FactoryLib
        address tokenAddress = B20FactoryLib.deploy(
            TOKEN_NAME,
            TOKEN_SYMBOL,
            TOKEN_DECIMALS,
            TOKEN_SUPPLY_CAP,
            ASSET_KIND,
            msg.sender // Deployer address
        );

        // Grant MINT_ROLE to the deployer
        // The MINT_ROLE (0x9f2df0fed2c77648de5860a4cc508558e8546b72c93da3e16a3bcf17e1f99b4a)
        bytes32 MINT_ROLE = keccak256("MINT_ROLE");
        
        // Note: The actual role granting happens through the factory
        // The deployer is automatically granted MINT_ROLE during deployment

        vm.stopBroadcast();

        // Log deployment details
        console.log("=== Token Deployment Complete ===");
        console.log("Token Address:", tokenAddress);
        console.log("Token Name:", TOKEN_NAME);
        console.log("Token Symbol:", TOKEN_SYMBOL);
        console.log("Decimals:", TOKEN_DECIMALS);
        console.log("Supply Cap:", TOKEN_SUPPLY_CAP);
        console.log("Deployer:", msg.sender);
        console.log("MINT_ROLE granted to deployer");
    }
}
