import 'package:wallpaper_app/model/data_photo_model.dart';

abstract class PhotoState {}

class PhotoInitialState extends PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  DataPhotoModel wallpaperModel;

  PhotoLoadedState({required this.wallpaperModel});
}

class PhotoErrorState extends PhotoState {
  String errMsg;

  PhotoErrorState({required this.errMsg});
}

class PhotoInternetErrorState extends PhotoState {
  String errMsg;

  PhotoInternetErrorState({required this.errMsg});
}
