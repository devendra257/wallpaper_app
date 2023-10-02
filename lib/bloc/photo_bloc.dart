import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/api_urls.dart';
import 'package:wallpaper_app/api/my_exception.dart';
import 'package:wallpaper_app/bloc/photo_event.dart';
import 'package:wallpaper_app/bloc/photo_state.dart';
import 'package:wallpaper_app/model/data_photo_model.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  ApiHelper apiHelper;

  PhotoBloc({required this.apiHelper}) : super(PhotoInitialState()) {
    on<GetTrenddingWallpaper>(
      (event, emit) async {
        emit(PhotoLoadingState());

        try {
          var res = await apiHelper.getApi(url: APIUrls.trendingUrl);

          emit(PhotoLoadedState(wallpaperModel: DataPhotoModel.fromJson(res)));
        } catch (e) {
          if (e is PhotoInternetErrorState) {
            // emit(PhotoInternetErrorState(errMsg: e.toString()));

            emit(
                PhotoInternetErrorState(errMsg: (e as MyException).ToString()));
          } else {
            emit(PhotoErrorState(errMsg: (e as MyException).ToString()));
          }
        }

//  var res = await apiHelper.getApi(
//             url: APIUrls
//                 .trendingUrl); //* url: "${APIUrls.trendingUrl}?per_page=20"
        // if (res != null) {
        //   //* Loaded State

        //   emit(PhotoLoadedState(wallpaperModel: DataPhotoModel.fromJson(res)));
        // } else {
        //   //* Error State

        //   emit(PhotoErrorState(errMsg: "Internet Error"));
        // }
      },
    );
  }
}
