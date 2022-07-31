class CryptoModel {
  final String name;
  final String symbol;
  final String image;
  final num currentprice;
  final num hour24pricechange;
  final num marketcap;

  CryptoModel(
      {required this.name,
      required this.symbol,
      required this.image,
      required this.currentprice,
      required this.hour24pricechange,
      required this.marketcap});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        name: json['name'],
        symbol: json['symbol'],
        image: json['image'],
        currentprice: json['current_price'],
        hour24pricechange: json['price_change_24h'],
        marketcap: json['market_cap']);
  }

  static Map<String, dynamic> toMap(CryptoModel crypto) {
    return {
      "name":crypto.name,
      "symbol":crypto.symbol,
      "image":crypto.image,
      "current_price":crypto.currentprice,
      "price_change_24h":crypto.hour24pricechange,
      "market_cap":crypto.marketcap
    };
  }



}
