import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';

// ignore: must_be_immutable
class PhotoViewer extends StatelessWidget {
  String imgViewer;
  double? mWidth;
  double? mHeight;

  PhotoViewer({super.key, required this.imgViewer});

  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imgViewer,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(child: CircularProgressIndicator());
              },
            ),
            // child: Image.network(
            //   imgViewer,
            //   fit: BoxFit.cover,
            // ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(97, 255, 255, 255),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: const Icon(
                        Icons.cancel,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Downloading.....')));
                      downloadWallpaper();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(97, 255, 255, 255),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: const Icon(
                        Icons.download,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Set Wallpaper...')));
                      setWallpaper();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(97, 255, 255, 255),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: const Icon(
                        Icons.wallpaper,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void downloadWallpaper() {
    GallerySaver.saveImage(imgViewer).then(
      (value) {
        print(value);
      },
    );
  }

  void setWallpaper() {
    var wallStream = Wallpaper.imageDownloadProgress(imgViewer);

    wallStream.listen((event) {
      print(event);
    }, onDone: () async {
      print('Wallpaper Download in a caches..');

      await Wallpaper.homeScreen(
        width: mWidth!,
        height: mHeight!,
        options: RequestSizeOptions.RESIZE_FIT,
      );
    }, onError: (error) {
      print('error : $error');
    });
  }
}
