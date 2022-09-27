import 'dart:developer';
import 'dart:io';

import 'package:game_database/core/models/game_model.dart';
import 'package:http/http.dart' as mubs;

class HttpServices {
  loadData() async {
    log("message");
    const url = "https://api.igdb.com/v4/games";
    var pathUrl = Uri.parse(url);
    try {
      var response = await mubs.post(pathUrl,
          headers: {
            "Client-ID": "6gm0m6ydj1w5he1n8mrpi87litzvn2",
            "Authorization": "Bearer cyt0jfklcmc0vazvpe7qdtgi479qwa"
          },
          body: "fields *;");
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        String responseString = response.body;
        List<GameModel> data = gameModelFromJson(responseString);
        return data;
      }
    } on SocketException {
      return "Network Error";
    } catch (e) {
      return e;
    }
  }
}
