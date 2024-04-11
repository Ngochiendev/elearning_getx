class VideosModel {
  int? id;
  int? sessionId;
  List? resolutions;
  String? videoId;
  String? source;
  int? length;
  String? thumbnail;
  int? orderId;
  String? briefDescription;
  String? createdAt;
  String? updatedAt;
  
  VideosModel({
    this.id,
    this.sessionId,
    this.resolutions,
    this.videoId,
    this.source,
    this.length,
    this.thumbnail,
    this.orderId,
    this.briefDescription,
    this.createdAt,
    this.updatedAt,
  
  });

  VideosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionId = json['sessionId'];
    resolutions = json['resolutions'];
    videoId = json['videoId'];
    source = json['source'];
    length = json['length'];
    thumbnail = json['thumbnail'];
    orderId = json['orderId'];
    briefDescription = json['briefDescription'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sessionId'] = sessionId;
    data['resolutions'] = resolutions;
    data['videoId'] = videoId;
    data['source'] = source;
    data['length'] = length;
    data['thumbnail'] = thumbnail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
