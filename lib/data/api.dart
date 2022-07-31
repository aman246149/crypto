import 'dart:convert';

import 'package:apitesting/global/apikey/api_key.dart';
import 'package:apitesting/global/errors/errormessage.dart';
import 'package:apitesting/model/crypto.dart';
import 'package:either_dart/either.dart';

import 'package:http/http.dart' as http;

class Api {
  Future<Either<CustomError, List<CryptoModel>>> fetchAlbum() async {
    final response = await http.get(
        Uri.parse(
            'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=50&page=1&sparkline=false'),
     );

    try {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<CryptoModel> data = [];
      var decodedJson = jsonDecode(response.body);
      for (int i = 0; i < decodedJson.length; i++) {
        data.add(CryptoModel.fromJson(decodedJson[i]));
      }
      return Right(data);
    } catch (e) {
      return Left(CustomError(errorMsg: e.toString()));
    }
  }
}
