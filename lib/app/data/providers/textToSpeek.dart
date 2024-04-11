import 'dart:convert';

import 'package:elearning/app/data/models/speak_model.dart';
import 'package:elearning/app/data/providers/api_result.dart';
import 'package:elearning/app/data/providers/base_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TextToSpeed extends BaseProvider {
  static final TextToSpeed instance = TextToSpeed._internal();
  factory TextToSpeed() => instance;
  TextToSpeed._internal() {
    initProvider("BASE_API_TEXTTOSPEAK");
  }

  Future<ApiResult> getAutio(String text) async {
    Map<String, dynamic> json = {
      "audioConfig": {
        "audioEncoding": "LINEAR16",
        "pitch": 0,
        "speakingRate": 1
      },
      "input": {"text": text},
      "voice": {"languageCode": "vi-VN", "name": "vi-VN-Standard-A"}
    };
    return await POSTAUDIO(
      'key=AIzaSyDJ0IxmLoqE-brrtCOtZVl_fyG7HH_GlGM',
      json,
    );
  }
}
