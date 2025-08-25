class Coins {
  String id;
  String symbol;
  String name;

  Coins({required this.id, required this.symbol, required this.name});

  static List<Coins> topCoins = [
    Coins(id: "bitcoin", symbol: "btc", name: "Bitcoin"),
    Coins(id: "ethereum", symbol: "eth", name: "Ethereum"),
    Coins(id: "tether", symbol: "usdt", name: "Tether"),
    Coins(id: "binancecoin", symbol: "bnb", name: "BNB"), // diperbaiki
    Coins(id: "solana", symbol: "sol", name: "Solana"),
    Coins(id: "ripple", symbol: "xrp", name: "XRP"), // diperbaiki
    Coins(id: "usd-coin", symbol: "usdc", name: "USD Coin"),
    Coins(id: "cardano", symbol: "ada", name: "Cardano"),
    Coins(id: "dogecoin", symbol: "doge", name: "Dogecoin"),
    Coins(id: "tron", symbol: "trx", name: "TRON"),
  ];
}
