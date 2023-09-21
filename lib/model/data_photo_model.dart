import 'package:wallpaper_app/model/photo_model.dart';

class DataPhotoModel {
  String? nextPage;
  int? page;
  int? perPage;
  int? totalResults;
  List<PhotoModel>? photos;

  DataPhotoModel({
    this.nextPage,
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
  });

  factory DataPhotoModel.fromJson(Map<String, dynamic> json) {
    List<PhotoModel> mPhoto = [];

    for (Map<String, dynamic> eachPhoto in json['photos']) {
      mPhoto.add(PhotoModel.fromJosn(eachPhoto));
    }

    return DataPhotoModel(
      nextPage: json['next_page'],
      page: json['page'],
      perPage: json['per_page'],
      totalResults: json['total_results'],
      photos: mPhoto,
    );
  }
}
