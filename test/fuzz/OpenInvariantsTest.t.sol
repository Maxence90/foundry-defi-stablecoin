// // SPDX-License-Identifier: MIT

// //Have our invariant aka properties 包含我们的不变性

// //1.DSC的总供应量应该小于抵押品的总价值

// //2.getter函数或视图函数不应该回滚

// pragma solidity ^0.8.30;

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentrailzedStableCoin} from "../../src/DecentrailzedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

// contract OpenInvariant is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentrailzedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setUp() external {
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (,, weth, wbtc,) = config.activeNetworkConfig();

//         targetContract(address(dsce)); //对这个进行完全随机测试
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         //获取协议中所有抵押品的价值和DSC进行比较
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(dsce));
//         uint256 totalWbtcDeposited = IERC20(wbtc).balanceOf(address(dsce));

//         uint256 wethValue = dsce.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = dsce.getUsdValue(wbtc, totalWbtcDeposited);

//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }
