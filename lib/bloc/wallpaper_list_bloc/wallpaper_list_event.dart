abstract class WallpaperListEvent {}

class GetSearchWallpaper extends WallpaperListEvent {
  String query;
  String? mColor;
  int pageNo;

  GetSearchWallpaper({required this.query, this.mColor, this.pageNo = 1});
}
