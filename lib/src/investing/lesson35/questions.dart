var questions = [
  {
    "question": "What is the primary difference between a stock and a bond?",
    "answers": [
      "Stocks represent ownership in a company, while bonds represent a loan to the company.",
      "Stocks pay fixed interest, while bonds pay dividends.",
      "Bonds have no maturity date, while stocks do.",
      "Stocks are always more stable investments than bonds.",
    ],
    "correctAnswer": 0,
  },
  {
    "question": "What is an ETF?",
    "answers": [
      "A type of mutual fund",
      "A fund that trades on an exchange like a stock",
      "A bond issued by a government",
      "A derivative contract",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "Which type of cryptocurrency is primarily designed to maintain a stable value relative to a fiat currency?",
    "answers": ["Stablecoin", "Meme coin", "Layer 1 coin", "AI coin"],
    "correctAnswer": 0,
  },
  {
    "question": "What is the purpose of a dividend in stocks?",
    "answers": [
      "To increase the stock's price",
      "To represent a share of the company's profits to shareholders",
      "To pay off company debt",
      "To dilute existing shares",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "Which type of bond is backed by a specific asset or revenue source?",
    "answers": [
      "Convertible bond",
      "Secured bond",
      "Unsecured bond",
      "Callable bond",
    ],
    "correctAnswer": 1,
  },
  {
    "question": "What does market capitalization represent in stocks?",
    "answers": [
      "The total number of shares available for trade",
      "The total value of a company's outstanding shares",
      "The dividend yield of a stock",
      "The interest paid on a stock",
    ],
    "correctAnswer": 1,
  },
  {
    "question": "What is a smart contract in the context of cryptocurrencies?",
    "answers": [
      "A legal agreement signed electronically",
      "A self-executing contract coded into blockchain",
      "A financial agreement between two parties",
      "A traditional contract stored digitally",
    ],
    "correctAnswer": 1,
  },
  {
    "question": "What is the primary role of an exchange-traded fund (ETF)?",
    "answers": [
      "To lend money to corporations",
      "To trade individual stocks",
      "To pool investor money to invest in a diversified portfolio",
      "To pay dividends to shareholders",
    ],
    "correctAnswer": 2,
  },
  {
    "question": "How does a bond's coupon rate relate to its yield?",
    "answers": [
      "They are always the same",
      "Coupon rate represents fixed interest; yield represents return considering price",
      "Yield is fixed, while the coupon rate varies",
      "Both are calculated based on market interest rates",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "What is a key characteristic of a mutual fund compared to an ETF?",
    "answers": [
      "Mutual funds trade like stocks during market hours",
      "ETFs are professionally managed while mutual funds are not",
      "Mutual funds often have higher fees than ETFs",
      "ETFs are only available to institutional investors",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "If you buy 100 shares of a stock at \$50 per share and sell them at \$60 per share, what is your total profit?",
    "answers": ["\$500", "\$600", "\$1,000", "\$1,500"],
    "correctAnswer": 2,
    "explanation": "100 shares x \$10 profit per share = \$1,000",
  },
  {
    "question":
        "A bond has a face value of \$1,000 and a coupon rate of 5%. How much interest will it pay annually?",
    "answers": ["\$50", "\$100", "\$500", "\$5"],
    "correctAnswer": 0,
    "explanation": "5% of \$1,000 = \$50",
  },
  {
    "question":
        "If you own 200 shares of a stock that pays a quarterly dividend of \$0.50 per share, what is your annual dividend income?",
    "answers": ["\$200", "\$400", "\$600", "\$800"],
    "correctAnswer": 1,
    "explanation": "200 shares x \$0.50 x 4 quarters = \$400",
  },
  {
    "question":
        "You invest \$10,000 in an ETF with an annual return of 8%. How much will your investment be worth after one year?",
    "answers": ["\$10,800", "\$11,000", "\$12,000", "\$12,800"],
    "correctAnswer": 0,
    "explanation": "\$10,000 x 1.08 = \$10,800",
  },
  {
    "question":
        "A cryptocurrency has a total supply of 1 million coins, with 800,000 in circulation. If each coin is valued at \$2, what is its market capitalization?",
    "answers": ["\$1.6 million", "\$2 million", "\$1 million", "\$800,000"],
    "correctAnswer": 0,
    "explanation": "800,000 coins x \$2 = \$1.6 million",
  },
  {
    "question":
        "You buy a stock at \$30 and later sell it at \$40. If you paid \$2 in transaction fees for both the buy and sell, what is your net profit per share?",
    "answers": ["\$8", "\$10", "\$6", "\$12"],
    "correctAnswer": 2,
    "explanation": "\$40 - \$30 - \$4 fees = \$6",
  },
  {
    "question":
        "If an ETF has a total expense ratio of 0.5% and you invest \$5,000, what will your annual expense be?",
    "answers": ["\$50", "\$25", "\$2.50", "\$500"],
    "correctAnswer": 1,
    "explanation": "0.5% of \$5,000 = \$25",
  },
  {
    "question":
        "A bond with a face value of \$1,000 is bought for \$950 and pays a 6% annual coupon. What is the bond's yield to maturity?",
    "answers": ["5%", "6%", "6.32%", "6.5%"],
    "correctAnswer": 2,
    "explanation": "(\$60 coupon + (\$50 gain/10 years)) / \$950 = 6.32%",
  },
  {
    "question":
        "If a cryptocurrency with 500,000 coins in circulation has a market cap of \$5 million, what is its current price per coin?",
    "answers": ["\$1", "\$5", "\$10", "\$100"],
    "correctAnswer": 2,
    "explanation": "\$5 million / 500,000 coins = \$10",
  },
  {
    "question":
        "A stock has a P/E (price-to-earnings) ratio of 20, and its earnings per share (EPS) is \$2. What is its stock price?",
    "answers": ["\$10", "\$20", "\$40", "\$80"],
    "correctAnswer": 2,
    "explanation": "P/E = Stock Price / EPS; Stock Price = 20 x \$2 = \$40",
  },
  {
    "question":
        "If a company's dividend payout ratio is higher than its peers, what does this indicate?",
    "answers": [
      "It is reinvesting most of its profits",
      "It is distributing more of its earnings as dividends",
      "It has a higher P/E ratio",
      "It is underperforming its competitors",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency has a significantly high volume and rising price. What could this indicate?",
    "answers": [
      "The asset is experiencing high interest and liquidity",
      "The asset is not gaining traction",
      "The asset has low trading activity",
      "The asset's value is likely to drop",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "A stock has a consistently high P/E (Price to Earnings) ratio compared to its industry average. This could be interpreted as:",
    "answers": [
      "A sign that the stock is overvalued",
      "A sign that the stock is undervalued",
      "An indication of average value",
      "An irrelevant metric",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "An ETF has a very low expense ratio. This is generally a sign of:",
    "answers": [
      "High operating costs",
      "Efficient management and low costs for investors",
      "Poor asset performance",
      "High returns",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A cryptocurrency has low liquidity and large spreads between bid and ask prices. This could indicate:",
    "answers": [
      "High demand for the cryptocurrency",
      "High stability in prices",
      "Limited market participation and higher trading risks",
      "A mature and established market",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "A company consistently reports an increasing Dividend Yield while its stock price is falling. This usually indicates:",
    "answers": [
      "The company is in good financial health",
      "The company is in financial distress",
      "High market confidence in the company",
      "The company is becoming a market leader",
    ],
    "correctAnswer": 1,
  },
  {
    "question":
        "A bond with a high yield compared to similar-rated bonds could indicate:",
    "answers": [
      "High liquidity",
      "High interest rates in the economy",
      "Higher credit risk associated with the bond",
      "Lower credit risk associated with the bond",
    ],
    "correctAnswer": 2,
  },
  {
    "question":
        "A large-cap stock index ETF has significantly outperformed other major stock indices in the past quarter. This may indicate:",
    "answers": [
      "Market-wide underperformance of small and mid-cap stocks",
      "A sudden rise in bond yields",
      "Improved performance of all large-cap stocks globally",
      "A stable and predictable market",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "A cryptocurrency’s blockchain network consistently records increasing transaction fees over time. This is usually an indication of:",
    "answers": [
      "Increasing usage and network congestion",
      "Decreasing adoption and network stability",
      "Reduced interest in mining",
      "A mature and stable network",
    ],
    "correctAnswer": 0,
  },
  {
    "question":
        "A stock is trading at a price significantly below its book value. This may imply:",
    "answers": [
      "The stock is overvalued",
      "The company has hidden value",
      "The company has high growth potential",
      "Investors are skeptical about the company's future prospects",
    ],
    "correctAnswer": 3,
  },
  {
    "question":
        "A sector-specific ETF is showing consistent underperformance relative to other sector-specific ETFs. This may suggest:",
    "answers": [
      "The sector is experiencing strong economic growth",
      "The ETF has a higher expense ratio",
      "The sector represented by the ETF is facing economic challenges",
      "The ETF is well-diversified",
    ],
    "correctAnswer": 2,
  }
];
