// // SPDX-Lincense-Identifier: MIT

// pragma solidity ^0.8.18;

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// contract OpenInvariantsTest is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address wbtc;
//     address weth;

//     function setUp() external {
//         deployer = new DeployDSC();
//         (dsce, dsc, config) = deployer.run();
//         (,, wbtc, weth,) = config.activeNetworkConfig();
//         targetContract(address(dsce));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWbtcSupply = IERC20(wbtc).balanceOf(address(dsce));
//         uint256 totalWethSupply = IERC20(weth).balanceOf(address(dsce));

//         uint256 wbtcValue = dsce.getUsdValue(wbtc, totalWbtcSupply);
//         uint256 wethValue = dsce.getUsdValue(weth, totalWethSupply);

//         assert(wbtcValue + wethValue >= totalSupply);
//     }
// }
