import 'package:wallpaper_app/model/data_photo_model.dart';

abstract class WallpaperListState {}

class WallpaperListInitialState extends WallpaperListState {}

class WallpaperListLoadingState extends WallpaperListState {}

class WallpaperListLoadedState extends WallpaperListState {
  DataPhotoModel photoModel;

  WallpaperListLoadedState({required this.photoModel});
}

class WallpaperListInternetErrorState extends WallpaperListState {
  String errMsg;

  WallpaperListInternetErrorState({required this.errMsg});
}

class WallpaperListErrorState extends WallpaperListState {
  String errMsg;

  WallpaperListErrorState({required this.errMsg});
}
