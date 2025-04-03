var questions = [
  {
    "question":
        "If a cryptocurrency has a circulating supply of 10 million coins, and each coin is priced at \$50, what is the market capitalization?",
    "answers": ["\$500,000", "\$5 million", "\$50 million", "\$500 million"],
    "correctAnswer": 3,
  },
  {
    "question":
        "How does blockchain technology help in securing cryptocurrency transactions?",
    "answers": [
      "By allowing central authorities to manage the ledger",
      "By requiring users to verify their identity",
      "By using a decentralized network of computers to validate and store transaction data",
      "By restricting access to select users",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "A miner successfully mines a block that contains 10 transactions, including a reward of 6.25 BTC. If the miner collects 1 BTC as transaction fees from all 10 transactions, how much total BTC does the miner earn?",
    "answers": ["5.25 BTC", "6.25 BTC", "7.25 BTC", "8.25 BTC"],
    "correctAnswer": 2,
  },
  {
    "question":
        "Which wallet type provides the highest security against online hacking?",
    "answers": [
      "Hot wallet",
      "Exchange wallet",
      "Cold wallet",
      "Mobile wallet",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "How do blockchain networks prevent double-spending of cryptocurrencies?",
    "answers": [
      "By encrypting private keys",
      "By relying on a centralized authority to manage transactions",
      "By using distributed ledger technology and validation by miners",
      "By limiting the number of transactions per user",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "What advantage does decentralized trust offer in cryptocurrencies?",
    "answers": [
      "Centralized management",
      "Reduced risk of censorship and control by central authorities",
      "Government regulation",
      "Enhanced dependency on banks",
    ],
    "correctAnswer": 1,
  },
  {
    "question": "Why do cryptocurrencies like Bitcoin have a capped supply?",
    "answers": [
      "To make mining easier",
      "To act as a hedge against inflationary pressures",
      "To create competition with other cryptocurrencies",
      "To enable central authorities to control money supply",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "Using the principles of technical analysis, which scenario suggests a good opportunity to buy?",
    "answers": [
      "An upward trendline has been broken",
      "An asset has been overbought",
      "A strong support level has held after a pullback",
      "A resistance level has been tested repeatedly",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "Which practice helps protect cryptocurrency wallets from unauthorized access?",
    "answers": [
      "Sharing private keys only with trusted friends",
      "Using strong, unique passwords and enabling 2FA",
      "Storing private keys in online cloud storage",
      "Using a single password for all online accounts",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "What is a common technique used by phishing scams to steal crypto credentials?",
    "answers": [
      "Spoofing a legitimate website to steal sensitive data",
      "Sending SMS codes to verify account security",
      "Offering double the amount of coins in return",
      "Selling fake coins through airdrops",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "You're evaluating a cryptocurrency project and notice the team behind it remains anonymous and does not disclose their identities. The project promises high returns but lacks a whitepaper. What is the best course of action?",
    "answers": [
      "Invest quickly to not miss out on potential returns",
      "Wait for more information before investing",
      "Ignore the project due to lack of transparency",
      "Trust the project's claims and invest immediately",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "A cryptocurrency project boasts that it has no competition and claims it will revolutionize the industry. However, after research, you find several established projects with similar goals and stronger technical capabilities. What should you infer about this project?",
    "answers": [
      "It likely has an edge over its competition",
      "It may be overpromising its uniqueness",
      "It is too risky to consider",
      "It is better to invest in a project with no competition",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency project has a whitepaper that explains its technical aspects clearly and has a detailed roadmap. The team is publicly known and consists of experts in blockchain technology and finance. Is this a good sign for the project's credibility?",
    "answers": [
      "Yes, it indicates transparency and expertise",
      "No, whitepapers don't matter in crypto",
      "No, only price performance is relevant",
      "Yes, but only if the team has developed other successful projects",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "You discover that a cryptocurrency project claims its token supply is capped at a certain number, but there have been multiple instances where the supply has increased beyond the stated cap. What does this indicate about the project?",
    "answers": [
      "The project is trustworthy",
      "The project may lack transparency or integrity",
      "The project has a solid financial strategy",
      "The project has strong community support",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "While evaluating a stablecoin project, you find that it is backed by fiat reserves held in a reputable bank and undergoes regular audits. The stablecoin has been stable and widely accepted across exchanges. Is this a good sign for the stablecoin's reliability?",
    "answers": [
      "Yes, because it indicates stability and transparency",
      "No, because it's tied to fiat currency",
      "No, because it hasn't been tested in extreme market conditions",
      "Yes, because it is the oldest stablecoin",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "You learn that a cryptocurrency project has partnered with several well-known companies and institutions in the blockchain and financial sectors. What should you infer about the project?",
    "answers": [
      "The partnerships are likely not relevant",
      "The project has industry support, indicating potential for success",
      "The project is risky despite the partnerships",
      "The partnerships will only add value if they include government entities",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency's price chart shows a clear upward trendline, with the price repeatedly bouncing off this trendline. However, it recently broke below the trendline for the first time in months. How should this be interpreted?",
    "answers": [
      "The price is likely to recover quickly",
      "The upward trend may be losing momentum",
      "The trendline break is not significant",
      "The cryptocurrency is in a consolidation phase",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "Analyzing a candlestick chart, you notice a pattern of long upper shadows on multiple candles, indicating that prices closed much lower than their intra-day highs. What could this suggest?",
    "answers": [
      "Strong buying interest",
      "The cryptocurrency is overbought",
      "Strong selling pressure",
      "The cryptocurrency is oversold",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "You see that a cryptocurrency has been trading in a defined range, consistently finding support at \$100 and facing resistance at \$120. Recently, the price has decisively broken above \$120. What does this suggest?",
    "answers": [
      "The price is likely to fall back to \$100",
      "The price is breaking out and could continue to rise",
      "The range is expanding, and volatility will increase",
      "The price will remain stagnant",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "Analyzing the Relative Strength Index (RSI) of a cryptocurrency, you notice that it has been above 70 for several days. How should this information be interpreted?",
    "answers": [
      "The cryptocurrency is in an uptrend",
      "The cryptocurrency is overbought and could see a price correction",
      "The cryptocurrency is oversold and likely to bounce",
      "The RSI is not relevant in this case",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency has a circulating supply of 1 billion coins and a total supply of 1.5 billion coins. The project team has not disclosed a maximum supply cap. Is this a good sign?",
    "answers": [
      "Yes, because the supply will meet the high demand",
      "No, because the lack of a cap could lead to inflation",
      "Yes, because more coins will improve liquidity",
      "No, because the project has a high total supply",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency has a market capitalization of \$2 billion but has consistently low trading volume over the past few months. The project aims to solve a niche problem and has a small but active community. Is this a good sign?",
    "answers": [
      "Yes, because low volume indicates low volatility",
      "No, because low volume suggests limited liquidity",
      "Yes, because high market",
      "No, because niche problems limit adoption",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency's whitepaper mentions partnerships with prominent companies but provides no further details. The project has yet to deliver any working product or updates since its inception two years ago. Is this a good sign?",
    "answers": [
      "Yes, because partnerships add value",
      "No, because of a lack of transparency and progress",
      "Yes, because partnerships guarantee success",
      "No, because it hasn't seen price growth",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A coin has been issued as a governance token for a decentralized finance (DeFi) platform. The project's whitepaper explains in detail how users can participate in governance and voting. There is also transparency in showing how funds are distributed to developers and contributors. Is this a good sign?",
    "answers": [
      "Yes, because transparency builds trust in the project",
      "No, because it might create a central point of control",
      "Yes, because governance tokens always increase in value",
      "No, because it is only useful for governance",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "A coin has seen rapid price growth of 200% in the past week. However, it was revealed that a single wallet holds 50% of the coin's total supply. Is this a good sign?",
    "answers": [
      "Yes, because holding a large supply ensures stability",
      "No, because this centralization creates significant market risk",
      "Yes, because the rapid growth will continue",
      "No, because rapid growth always signals an impending crash",
    ],
    "correctAnswer": 1,
  },
];
