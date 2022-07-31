import 'dart:convert';

import 'package:apitesting/model/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteStorage {
  static Future<List<CryptoModel>> addData(CryptoModel data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<CryptoModel> favlist = [];
    List<String>? list = await sharedPreferences.getStringList("favourites");

    if (list != null) {
      if (list.isNotEmpty) {
        //map data
        var decodedlist = jsonDecode(list.toString());
        for (int i = 0; i < decodedlist[0].length; i++) {
          final CryptoModel ldata = CryptoModel.fromJson(decodedlist[0][i]);
          favlist.add(ldata);
        }
      }
    }

    favlist.add(data);

    //encoding the data
    List<Map<String, dynamic>> lmap = [];
    for (int i = 0; i < favlist.length; i++) {
      lmap.add(CryptoModel.toMap(favlist[i]));
    }
    List<String> encodedList = [];
    final String encodedData = jsonEncode(lmap);
    encodedList.add(encodedData);
    await sharedPreferences.setStringList("favourites", encodedList);
    return favlist;
  }

  static Future<List<CryptoModel>> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<CryptoModel> favlist = [];
    List<String>? list = await sharedPreferences.getStringList("favourites");

    if (list == null) {
      return favlist;
    }

    if (list.isNotEmpty) {
      var decodedjson = jsonDecode(list.toString()); //map data
      for (int i = 0; i < decodedjson[0].length; i++) {
        final CryptoModel ldata = CryptoModel.fromJson(decodedjson[0][i]);
        favlist.add(ldata);
      }
    }

    return favlist;
  }
}
