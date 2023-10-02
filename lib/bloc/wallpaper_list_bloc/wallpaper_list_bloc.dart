import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/api_urls.dart';
import 'package:wallpaper_app/api/my_exception.dart';
import 'package:wallpaper_app/bloc/wallpaper_list_bloc/wallpaper_list_event.dart';
import 'package:wallpaper_app/bloc/wallpaper_list_bloc/wallpaper_list_state.dart';
import 'package:wallpaper_app/model/data_photo_model.dart';

class WallpaperListBloc extends Bloc<WallpaperListEvent, WallpaperListState> {
  ApiHelper apiHelper;
  WallpaperListBloc({required this.apiHelper})
      : super(WallpaperListInitialState()) {
    //* Get SearchWallpaper Function Calling..
    on<GetSearchWallpaper>(
      (event, emit) async {
        emit(WallpaperListLoadingState());

        try {
          print(
              '${APIUrls.searchUrl}?query=${event.query}&per_page=20&color=${event.mColor ?? ''}&page=${event.pageNo}}');
          var res = await apiHelper.getApi(
              url:
                  "${APIUrls.searchUrl}?query=${event.query}&per_page=20&color=${event.mColor ?? ''}&page=${event.pageNo}");

          emit(WallpaperListLoadedState(
              photoModel: DataPhotoModel.fromJson(res)));
        } catch (e) {
          if (e is WallpaperListInternetErrorState) {
            emit(WallpaperListInternetErrorState(
                errMsg: (e as MyException).ToString()));
          } else {
            emit(
                WallpaperListErrorState(errMsg: (e as MyException).ToString()));
          }
        }
      },
    );
  }
}
