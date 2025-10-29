// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";

contract Triggers is BaseTriggers {

    address public constant factoryAddress = 0x3140167E09d3cfB67b151C25d54fa356f644712D;
    address public constant factoryV4Address = 0xc301BaCE6E9409B1876347a3dC94EC24D18C1FE4;

    uint256 public constant factoryDeploymentBlock = 8416059;
    uint256 public constant factoryV4DeploymentBlock = 19020796;

    function triggers() external virtual override {
        Listener listener = new Listener();
        addTriggers(chainContract(Chains.WorldChain, factoryV4Address).withStartBlock(factoryV4DeploymentBlock), listener.allTriggers());
    }
}

contract Listener is TokenRegistryV2$EmitAllEvents {}
