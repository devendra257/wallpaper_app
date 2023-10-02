import 'package:wallpaper_app/model/src_model.dart';

class PhotoModel {
  String? alt;
  String? avgColor;
  int? height;
  int? id;
  bool? liked;
  String? photographer;
  int? photographerId;
  String? photographerUrl;
  SrcModel? src;
  String? url;
  int? width;

  PhotoModel({
    this.alt,
    this.avgColor,
    this.height,
    this.id,
    this.liked,
    this.photographer,
    this.photographerId,
    this.photographerUrl,
    this.src,
    this.url,
    this.width,
  });

  factory PhotoModel.fromJosn(Map<String, dynamic> json) {
    return PhotoModel(
      alt: json['alt'],
      avgColor: json['avg_color'],
      height: json['height'],
      id: json['id'],
      liked: json['liked'],
      photographer: json['photographer'],
      photographerId: json['photographer_id'],
      src: SrcModel.fromJson(json['src']),
      url: json['url'],
      width: json['width'],
    );
  }
}
