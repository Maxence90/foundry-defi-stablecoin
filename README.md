# Foundry Smart Contract Lottery智能合约彩票

# 简介
[对应CSDN文章连接](https://blog.csdn.net/2301_81272096/article/details/154174099?spm=1001.2014.3001.5502)

该项目旨在成为一种稳定币，用户可以存入 WETH 和 WBTC 来换取与美元挂钩的代币。

## 目录
- [简介](#简介)
- [快速开始](#快速开始)
  - [要求](#要求)
  - [快速上手](#快速上手)
- [使用方法](#使用方法)
  - [启动本地节点](#启动本地节点)
  - [library](#library)
  - [部署](#部署)
  - [部署-其他网络](#部署-其他网络)
  - [测试](#测试)
  - [测试覆盖率](#测试覆盖率)
- [部署到测试网或主网](#部署到测试网或主网)
- [Script脚本](#script脚本)
- [估算Gas费用](#估算gas费用)
- [格式化](#格式化)
- [Thank you!](#thank-you)

# 快速开始

## 要求

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - 如果你允许`git --version`可以看到类似`git version x.x.x`的响应，就说明可以继续。
- [foundry](https://getfoundry.sh/)
  - 如果你运行`forge --version`可以看到`forge 1.4.x(2025-10-14)`的响应，就说明可以继续。


## 快速上手

```
git clone https://github.com/Maxence90/foundry-defi-stablecoin
forge build
```

# 使用方法

## 启动本地节点

```
make anvil
```

## library

如果您在安装 chainlink 库时遇到困难，可以选择运行此命令。
```
forge install smartcontractkit/chainlink-brownie-contracts@latest
```

## 部署

这将默认为本地节点。您需要在另一个终端运行它，以便进行部署。
```
make deploy
```
## 部署-其他网络

[请参见下方](#部署到测试网或主网)

## 测试
```
forge test
```
or
```
forge test --fork-url $SEPOLIA_RPC_URL
```
## 测试覆盖率
```
forge coverage
```
## 部署到测试网或主网
1. 设置环境变量

您需要将 SEPOLIA_RPC_URL 和 PRIVATE_KEY 设置为环境变量。可以将它们添加到一个 .env 文件中，类似于 .env.example 中看到的。
- PRIVATE_KEY: 您帐户的私钥（例如来自 MetaMask）。注意：仅用于开发，请使用一个没有任何实际资金关联的私钥。
- SEPOLIA_RPC_URL: 这是您正在使用的 sepolia 测试网节点的 URL。您可以从  [Alchemy](https://alchemy.com/?a=673c802981) 免费获取一个。


如果您想在 Etherscan 上验证合约，可以添加您的 ETHERSCAN_API_KEY 。
1. 获取测试网ETH

前往 faucets.chain.link，并获取一些测试网 ETH。你应该能在 MetaMask 中看到 ETH 到账。

2. 部署
```
make deploy ARGS="--network sepolia"
```

## Script脚本
在部署到测试网或本地网后，可以运行脚本。

使用本地部署的 cast 示例：
1. 获取一些 WETH
```
cast send 0x694AA1769357215DE4FAC081bf1f309aDC325306 "deposit()" --value 0.1ether --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
```
2. 批准 WETH
```
cast send 0x694AA1769357215DE4FAC081bf1f309aDC325306 "approve(address,uint256)" 0xD6982Cf3f4268586367Afe7dc2a4FE1ba0334fFB 1000000000000000000 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY"
```
3. 存款和铸造 DSC
```
cast send 0xD6982Cf3f4268586367Afe7dc2a4FE1ba0334fFB "depositCollateralAndMintDsc(address,uint256,uint256)" 0x694AA1769357215DE4FAC081bf1f309aDC325306 100000000000000000 10000000000000000 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
```

## 估算Gas费用
你可以通过运行以下命令来估算 gas 费用：
```
forge snapshot
```
你会看到一个名为 .gas-snapshot 的输出文件

# 格式化
要运行代码格式化
```
forge fmt
```

# Thank you!
谢谢观看