class ApiModel {
  String? id;
  String? name;
  String? pack;
  String? type;
  List<String>? livery;
  String? filesize;
  String? description;
  String? images;
  String? download;
  String? downloadCount;
  String? seen;
  String? youtubeVideo;

  ApiModel(
      {this.id,
      this.name,
      this.livery,
      this.pack,
      this.type,
      this.filesize,
      this.description,
      this.images,
      this.download,
      this.downloadCount,
      this.seen,
      this.youtubeVideo});

  ApiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    images = json['images'];
    download = json['download'];
    downloadCount = json['download_count'];
    seen = json['seen'];
    livery = json['livery'].toString().isEmpty
        ? []
        : json['livery'].toString().split(",");
    youtubeVideo = json['youtube_video'];
    name = json['name'];
    pack = json['pack'];
    type = json['type'];
    filesize = json['filesize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['images'] = images;
    data['download'] = download;
    data['download_count'] = downloadCount;
    data['seen'] = seen;
    data['youtube_video'] = youtubeVideo;
    data['name'] = name;
    data['pack'] = pack;
    data['type'] = type;
    data['filesize'] = filesize;
    return data;
  }
}
