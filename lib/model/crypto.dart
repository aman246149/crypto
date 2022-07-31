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
      required this.marketcap
      });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        name: json['name'],
        symbol: json['symbol'],
        image: json['image'],
        currentprice: json['current_price'],
        hour24pricechange: json['price_change_24h'],
        marketcap: json['market_cap']
        );
  }
}
