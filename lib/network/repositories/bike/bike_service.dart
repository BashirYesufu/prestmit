import 'dart:async';

import 'package:prestmit/constants/image_path.dart';

class BikeService {
  Future<List<String>> getBikes() async {
    var completer = Completer<List<String>>();
    try {
      await Future.delayed(Duration(seconds: 4));
      List<String> response = [];
      for (var i = 0; i < 10; i++) {
        response.add(ImagePath.bike);
      }
      completer.complete(response);
    } catch (e) {
      completer.completeError(e.toString());
    }
    return completer.future;
  }
}