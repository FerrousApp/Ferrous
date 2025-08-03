class DemoAssetData {
  final String logo;
  final String badge;
  final String ticker;
  final String name;
  final String totalValue;
  final String returnOnInvestment;
  final String overview;
  final String providerName;
  final String providerInfo;
  final String disclaimer;
  final String position;
  final String positionValue;

  DemoAssetData({
    required this.logo,
    required this.badge,
    required this.ticker,
    required this.name,
    required this.totalValue,
    required this.returnOnInvestment,
    required this.overview,
    required this.providerName,
    required this.providerInfo,
    required this.disclaimer,
    required this.position,
    required this.positionValue,
  });
}

///
final hederaStaking = DemoAssetData(
  logo: "assets/logos/hedera.png",
  badge: "assets/logos/hedera.png",
  ticker: "HBAR",
  name: "Hedera Network Staking",
  totalValue: "\$14.66B",
  returnOnInvestment: "2.5% ARR",
  overview:
      "Hedera offers liquid staking for HBAR holders, allowing you to earn rewards by staking your tokens to a consensus node without locking your funds. Your entire balance is staked automatically, and tokens remain accessible at all times. \n\nTo earn rewards, you must be staked to a node for at least 24 hours, the node must meet its minimum stake, and the global staking reward account must hold enough HBAR. When active, staking rewards can reach up to 2.5% annually. Rewards go to the final account in the chain unless redirected. Staking helps secure the network while giving you passive HBAR income - with no slashing, no lockup, and no complicated setup.",
  providerName: "Hedera Hashgraph",
  providerInfo:
      "Hedera is a next-generation public distributed ledger that leverages a unique hashgraph consensus mechanism, offering high throughput, low fees, and finality within seconds. Unlike traditional blockchains, Hedera's design ensures fairness, scalability, and security at enterprise scale.\n\n"
      "The network is governed by a council of global enterprises across diverse sectors, including some of the world's most trusted names such as Google, IBM, Boeing, LG, Deutsche Telekom, Dell, and Standard Bank. These companies actively support the network and participate in its decision-making, ensuring long-term reliability and real-world utility.\n\n"
      "Staking on Hedera is non-custodial, meaning you retain ownership of your HBAR at all times. By delegating to a node, you help secure the network and earn passive rewards all without the risk of slashing or losing your funds.",
  disclaimer:
      "Returns are not guaranteed and may vary based on network conditions. Please do your own research before investing.",
  position: "2,500 HBAR",
  positionValue: "\u20A610,500",
);

final usdcHbarSaucerSwap = DemoAssetData(
  logo: "assets/logos/usdc.png",
  badge: "assets/logos/saucer.png",
  ticker: "USDC",
  name: "USDC-HBAR Liquidity Pool",
  totalValue: "\$13.31M",
  returnOnInvestment: "94.99% APR",
  overview:
      "The USDC/HBAR liquidity pool on SaucerSwap is a core part of the Hedera DeFi ecosystem. It's a pool of USDC and HBAR tokens locked in a smart contract that enables automated trading. This mechanism removes the need for a traditional order book, making it a key hub for converting a stablecoin into the network's native token. \n\nFor traders, this pool allows for instant token swaps. Users can trade their USDC for HBAR (or HBAR for USDC) at a price determined by the ratio of tokens within the pool. This process leverages Hedera's high transaction speed, minimal fees, and a fair transaction ordering system that helps prevent market manipulation. \n\nFor liquidity providers (LPs), this pool is an opportunity to earn passive income. By depositing an equal value of both USDC and HBAR, LPs enable these trades. In return, they receive a share of the trading fees collected from every swap. This can be further supplemented by additional token rewards from the SaucerSwap protocol itself.",
  providerName: "Saucer Swap",
  providerInfo:
      "SaucerSwap is a decentralized exchange (DEX) built on the Hedera network, designed to provide fast, secure, and low-cost trading of digital assets. It utilizes an automated market maker (AMM) model, allowing users to trade tokens directly from their wallets without relying on a centralized order book. \n\nThe platform supports various liquidity pools, enabling users to earn fees by providing liquidity. SaucerSwap also integrates with Hedera's unique features, such as its high throughput and low transaction costs, making it an efficient choice for DeFi activities on the network.",
  disclaimer:
      "The primary risk for LPs is impermanent loss. This occurs when the price of the deposited tokens changes, resulting in the value of the LP's position being less than if they had simply held the assets outside of the pool. The rewards earned from fees and farming are meant to offset this potential loss.",
  position: "\$200 USDC",
  positionValue: "\u20A6300,000",
);
final usdtHbarSaucerSwap = DemoAssetData(
  logo: "assets/logos/usdt.png",
  badge: "assets/logos/saucer.png",
  ticker: "USDT",
  name: "USDT-HBAR Liquidity Pool",
  totalValue: "\$71.52K",
  returnOnInvestment: "31.39% APR",
  overview:
      "The USDT/HBAR liquidity pool on SaucerSwap is a core part of the Hedera DeFi ecosystem. It's a pool of USDT and HBAR tokens locked in a smart contract that enables automated trading. This mechanism removes the need for a traditional order book, making it a key hub for converting a stablecoin into the network's native token. \n\nFor traders, this pool allows for instant token swaps. Users can trade their USDT for HBAR (or HBAR for USDT) at a price determined by the ratio of tokens within the pool. This process leverages Hedera's high transaction speed, minimal fees, and a fair transaction ordering system that helps prevent market manipulation. \n\nFor liquidity providers (LPs), this pool is an opportunity to earn passive income. By depositing an equal value of both USDT and HBAR, LPs enable these trades. In return, they receive a share of the trading fees collected from every swap. This can be further supplemented by additional token rewards from the SaucerSwap protocol itself.",
  providerName: "Saucer Swap",
  providerInfo:
      "'SaucerSwap is a decentralized exchange (DEX) built on the Hedera network, designed to provide fast, secure, and low-cost trading of digital assets. It utilizes an automated market maker (AMM) model, allowing users to trade tokens directly from their wallets without relying on a centralized order book. \n\nThe platform supports various liquidity pools, enabling users to earn fees by providing liquidity. SaucerSwap also integrates with Hedera's unique features, such as its high throughput and low transaction costs, making it an efficient choice for DeFi activities on the network.",
  disclaimer:
      "The primary risk for LPs is impermanent loss. This occurs when the price of the deposited tokens changes, resulting in the value of the LP's position being less than if they had simply held the assets outside of the pool. The rewards earned from fees and farming are meant to offset this potential loss.",
  position: "\$500 USDT",
  positionValue: "\u20A6750,000",
);

///
final List<DemoAssetData> demoAssets = [
  usdcHbarSaucerSwap,
  hederaStaking,
  usdtHbarSaucerSwap,
];
