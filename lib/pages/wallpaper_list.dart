import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_list_bloc/wallpaper_list_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_list_bloc/wallpaper_list_event.dart';
import 'package:wallpaper_app/bloc/wallpaper_list_bloc/wallpaper_list_state.dart';
import 'package:wallpaper_app/model/photo_model.dart';
import 'package:wallpaper_app/pages/photo_viewer.dart';

class WallpaperList extends StatefulWidget {
  String mQuery;
  String? mColor;

  WallpaperList({required this.mQuery, this.mColor});

  @override
  State<WallpaperList> createState() => _WallpaperListState();
}

class _WallpaperListState extends State<WallpaperList> {
  List<PhotoModel> listPhotos = [];
  int mPageNo = 1;
  late ScrollController mController;
  int totalResults = 0;

  // List listNaturalImage = [
  //   'assets/images/natural/img_natural16.jpg',
  //   'assets/images/natural/img_natural15.jpg',
  //   'assets/images/natural/img_natural14.jpg',
  //   'assets/images/natural/img_natural13.jpg',
  //   'assets/images/natural/img_natural12.jpg',
  //   'assets/images/natural/img_natural11.jpg',
  //   'assets/images/natural/img_natural10.jpg',
  //   'assets/images/natural/img_natural9.jpg',
  //   'assets/images/natural/img_natural8.jpg',
  //   'assets/images/natural/img_natural7.webp',
  //   'assets/images/natural/img_natural6.jpg',
  //   'assets/images/natural/img_natural5.jpg',
  //   'assets/images/natural/img_natural4.jpg',
  //   'assets/images/natural/img_natural3.jpg',
  //   'assets/images/natural/img_natural2.jpg',
  //   'assets/images/natural/img_natural.jpeg',
  // ];

  @override
  void initState() {
    mController = ScrollController()
      ..addListener(() {
        if (mController.position.pixels ==
            mController.position.maxScrollExtent) {
          print('end of list');
          mPageNo++;

          context.read<WallpaperListBloc>().add(
                GetSearchWallpaper(
                    query: widget.mQuery.replaceAll(" ", "%20"),
                    mColor: widget.mColor,
                    pageNo: mPageNo),
              );
        }

        //? 85% ke bad start karna h to...
        // if (mController.position.pixels >=
        //     (0.85 * mController.position.maxScrollExtent)) {}
      });

    super.initState();
    context.read<WallpaperListBloc>().add(GetSearchWallpaper(
        query: widget.mQuery.replaceAll(" ", "%20"),
        mColor: widget.mColor)); //* %20 ki jagah hum + ka b use kar skte h..
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // backgroundColor: Color(0xffD8EBED),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Text(
                      widget.mQuery.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocListener<WallpaperListBloc, WallpaperListState>(
                  listener: (_, state) {
                    if (state is WallpaperListLoadingState) {
                      // return const Center(
                      //   child: CircularProgressIndicator(),
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(mPageNo == 1
                              ? 'Loading..'
                              : 'Loading Next Page')));
                    } else if (state is WallpaperListErrorState) {
                      // return Center(
                      //   child: Text(
                      //     state.errMsg,
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // );
                    } else if (state is WallpaperListInternetErrorState) {
                      // return Center(
                      //   child: Lottie.asset(
                      //     'assets/json/internet_error.json',
                      //     fit: BoxFit.cover,
                      //   ),
                      // );
                    } else if (state is WallpaperListLoadedState) {
                      totalResults = state.photoModel.totalResults!;
                      listPhotos.addAll(state.photoModel.photos!);

                      setState(() {
                        //* Local Data Manage
                      });

                      // if (state.photoModel.photos!.isNotEmpty) {
                      //   listPhotos.addAll(state.photoModel.photos!);
                      //   return Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         '${state.photoModel.totalResults} wallpaper available',
                      //         textAlign: TextAlign.start,
                      //         style: const TextStyle(
                      //           fontSize: 22,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 20,
                      //       ),
                      //       // Image of the natural element
                      //       Expanded(
                      //         child: GridView.builder(
                      //           controller: mController,
                      //           itemCount: listPhotos.length,
                      //           gridDelegate:
                      //               const SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 3,
                      //             crossAxisSpacing: 11,
                      //             mainAxisSpacing: 11,
                      //             childAspectRatio: 9 / 16,
                      //           ),
                      //           itemBuilder: (context, index) {
                      //             return InkWell(
                      //               onTap: () {
                      //                 Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                     builder: (context) => PhotoViewer(
                      //                         imgViewer: listPhotos[index]
                      //                             .src!
                      //                             .original!),
                      //                   ),
                      //                 );
                      //               },
                      //               child: Container(
                      //                 width: 150,
                      //                 height: 300,
                      //                 decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(15),
                      //                   image: DecorationImage(
                      //                     fit: BoxFit.cover,
                      //                     image: NetworkImage(
                      //                       listPhotos[index].src!.portrait!,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       )
                      //     ],
                      //   );
                      // } else {
                      //   const Center(
                      //     child: Text('No Wallpaper Found'),
                      //   );
                      // }
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '$totalResults wallpaper available',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Image of the natural element
                      Expanded(
                        child: GridView.builder(
                          controller: mController,
                          itemCount: listPhotos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 11,
                            mainAxisSpacing: 11,
                            childAspectRatio: 9 / 16,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhotoViewer(
                                        imgViewer:
                                            listPhotos[index].src!.original!),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      listPhotos[index].src!.portrait!,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
