// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.audioContent,
    this.timepoints,
    this.audioConfig,
  });

  String? audioContent;
  List<dynamic>? timepoints;
  AudioConfig? audioConfig;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        audioContent:
            json["audioContent"] == null ? null : json["audioContent"],
        timepoints: json["timepoints"] == null
            ? null
            : List<dynamic>.from(json["timepoints"].map((x) => x)),
        audioConfig: json["audioConfig"] == null
            ? null
            : AudioConfig.fromJson(json["audioConfig"]),
      );

  Map<String, dynamic> toJson() => {
        "audioContent": audioContent == null ? null : audioContent,
        "timepoints": timepoints == null
            ? null
            : List<dynamic>.from(timepoints!.map((x) => x)),
        "audioConfig": audioConfig == null ? null : audioConfig!.toJson(),
      };
}

class AudioConfig {
  AudioConfig({
    this.audioEncoding,
    this.speakingRate,
    this.pitch,
    this.volumeGainDb,
    this.sampleRateHertz,
    this.effectsProfileId,
  });

  String? audioEncoding;
  int? speakingRate;
  int? pitch;
  int? volumeGainDb;
  int? sampleRateHertz;
  List<dynamic>? effectsProfileId;

  factory AudioConfig.fromJson(Map<String, dynamic> json) => AudioConfig(
        audioEncoding:
            json["audioEncoding"] == null ? null : json["audioEncoding"],
        speakingRate:
            json["speakingRate"] == null ? null : json["speakingRate"],
        pitch: json["pitch"] == null ? null : json["pitch"],
        volumeGainDb:
            json["volumeGainDb"] == null ? null : json["volumeGainDb"],
        sampleRateHertz:
            json["sampleRateHertz"] == null ? null : json["sampleRateHertz"],
        effectsProfileId: json["effectsProfileId"] == null
            ? null
            : List<dynamic>.from(json["effectsProfileId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "audioEncoding": audioEncoding == null ? null : audioEncoding,
        "speakingRate": speakingRate == null ? null : speakingRate,
        "pitch": pitch == null ? null : pitch,
        "volumeGainDb": volumeGainDb == null ? null : volumeGainDb,
        "sampleRateHertz": sampleRateHertz == null ? null : sampleRateHertz,
        "effectsProfileId": effectsProfileId == null
            ? null
            : List<dynamic>.from(effectsProfileId!.map((x) => x)),
      };
}
