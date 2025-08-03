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
final List<DemoAssetData> demoAssetsLP = [
  usdcHbarSaucerSwap,
  usdtHbarSaucerSwap,
];
final List<DemoAssetData> demoAssetsStaking = [
  // usdcHbarSaucerSwap,
  hederaStaking,
  // usdtHbarSaucerSwap,
];

final List<DemoAssetData> demoAssetsInvestments = [
  hederaStaking,
  ...[
    DemoAssetData(
      logo: "assets/logos/ondo.png",
      badge: "assets/logos/us_treasury.png",
      ticker: "OUSG",
      name: "Ondo US Treasury Yield",
      totalValue: "\$150M",
      returnOnInvestment: "4.8% APY",
      overview:
          "Ondo Finance offers tokenized exposure to short-term U.S. Treasury Bills via the OUSG token. These tokens represent ownership in a BlackRock-managed ETF and are fully backed by U.S. Treasuries, giving stable, low-risk returns in a compliant and transparent structure.",
      providerName: "Ondo Finance",
      providerInfo:
          "Ondo is a leading DeFi protocol focused on tokenized securities and RWAs. It partners with traditional asset managers like BlackRock to bridge real-world financial instruments to blockchain. Ondo is supported by top-tier firms like Pantera Capital and Coinbase Ventures.",
      disclaimer:
          "Performance may vary with interest rate changes. Not FDIC insured. Conduct your own due diligence before investing.",
      position: "1,200 OUSG",
      positionValue: "\$1,235.60",
    ),
    DemoAssetData(
      logo: "assets/logos/goldfinch.png",
      badge: "assets/logos/goldfinch.png",
      ticker: "GFI-Loan",
      name: "Goldfinch Private Credit",
      totalValue: "\$120M",
      returnOnInvestment: "11.0% APY",
      overview:
          "Goldfinch offers decentralized access to private credit opportunities. Investors supply stablecoins to vetted borrowers in emerging markets, such as fintechs and microfinance institutions, generating attractive, non-correlated yield.",
      providerName: "Goldfinch",
      providerInfo:
          "Goldfinch is a decentralized credit protocol focused on unlocking capital for real-world borrowers. It is backed by a16z, Coinbase, and IDEO CoLab. Goldfinch combines blockchain transparency with traditional underwriting.",
      disclaimer:
          "Returns depend on borrower repayment. Credit risk and protocol risk apply. Not risk-free.",
      position: "2,000 GFI-Loan tokens",
      positionValue: "\$2,150.00",
    ),
    DemoAssetData(
      logo: "assets/logos/maple.png",
      badge: "assets/logos/credit.png",
      ticker: "MPL-TRANCH",
      name: "Maple Direct Lending",
      totalValue: "\$95M",
      returnOnInvestment: "10.2% APY",
      overview:
          "Maple enables permissioned lending pools to real-world borrowers such as crypto firms and fintechs. Users can provide USDC to diversified lending pools and earn high-yield returns through institutional credit exposure.",
      providerName: "Maple Finance",
      providerInfo:
          "Maple is a DeFi lending protocol enabling undercollateralized loans for institutional borrowers. Trusted by lenders like Orthogonal, Maven 11, and BlockTower. Maple has facilitated over \$2B in loans since launch.",
      disclaimer:
          "Investors bear credit risk and platform risk. Not FDIC insured or risk-free.",
      position: "500 MPL-TRANCH",
      positionValue: "\$540.00",
    ),
  ],
  usdcHbarSaucerSwap,
  usdtHbarSaucerSwap,
];
