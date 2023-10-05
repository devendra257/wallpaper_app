import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper_app/bloc/photo_bloc.dart';
import 'package:wallpaper_app/bloc/photo_event.dart';
import 'package:wallpaper_app/bloc/photo_state.dart';
import 'package:wallpaper_app/pages/photo_viewer.dart';

import 'wallpaper_list.dart';

class WallpaperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WallpaperPageState();
}

class WallpaperPageState extends State<WallpaperPage> {
  List listImage = [
    'assets/images/natural/img_natural16.jpg',
    'assets/images/flower/img_flower.jpg',
    'assets/images/food/img_food.avif',
    'assets/images/flower/img_flower10.avif',
    'assets/images/natural/img_natural7.webp',
    'assets/images/animals/img_animals2.avif',
    'assets/images/food/img_food3.avif',
    'assets/images/flower/img_flower20.avif',
    'assets/images/film/img_film16.png',
    'assets/images/flower/img_flower23.avif',
    'assets/images/sports/img_sports.avif',
    'assets/images/street/img_street10.avif',
    'assets/images/natural/img_natural12.jpg',
    'assets/images/animals/img_animals3.avif',
    'assets/images/natural/img_natural4.jpg',
    'assets/images/sports/img_sports13.avif',
    'assets/images/film/img_film10.png',
  ];

  List listColor = [
    {'color': Colors.black, 'code': '000000'},
    {'color': Colors.deepOrange, 'code': 'FF5722'},
    {'color': Colors.amber, 'code': 'FFC107'},
    {'color': Colors.blueGrey, 'code': '607D8B'},
    {'color': Colors.cyan, 'code': '00BCD4'},
    {'color': Colors.red, 'code': 'red'},
    {'color': Colors.yellow, 'code': 'yellow'},
    {'color': Colors.orange, 'code': 'orange'},
    {'color': Colors.blue, 'code': 'blue'},
    {'color': Colors.purple, 'code': 'purple'},
    {'color': Colors.brown, 'code': 'brown'},
    {'color': Colors.green, 'code': 'green'},
    {'color': Colors.indigo, 'code': '3F51B5'},
    {'color': Colors.lightGreen, 'code': '8BC34A'},
    {'color': Colors.lime, 'code': 'CDDC39'},
    {'color': Colors.pink, 'code': 'pink'},
    {'color': Colors.white, 'code': 'white'},
    {'color': Colors.cyanAccent, 'code': '18FFFF'},
    {'color': Colors.deepPurple, 'code': '673AB7'},
  ];

  List<Map<String, dynamic>> categoriesName = [
    {
      'name': "Nature",
      'img_cat': 'assets/images/natural/img_natural12.jpg',
    },
    {
      'name': "Flowers",
      'img_cat': 'assets/images/flower/img_flower233.png',
    },
    {
      'name': "Sports",
      'img_cat': 'assets/images/sports/img_sports20.avif',
    },
    {
      'name': "Film",
      'img_cat': 'assets/images/film/img_film11.webp',
    },
    {
      'name': "Street Photography",
      'img_cat': 'assets/images/street/img_street10.avif',
    },
    {
      'name': "Animals",
      'img_cat': 'assets/images/animals/img_animals14.avif',
    },
    {
      'name': "Fashion & Beauty",
      'img_cat': 'assets/images/street/img_street15.avif',
    },
    {
      'name': "Food & Drink",
      'img_cat': 'assets/images/food/img_food18.avif',
    },
    {'name': "Travel", 'img_cat': 'assets/images/street/img_street18.avif'},
    {
      'name': "Health & Wellness",
      'img_cat': 'assets/images/sports/img_sports19.avif'
    },
    {
      'name': "Arts & Culture",
      'img_cat': 'assets/images/film/img_film6.avif',
    },
    {
      'name': "Car",
      'img_cat': 'assets/images/film/img_film6.avif',
    },
    // {'name': "Flowers", 'img_cat': 'assets/images/img_natural13.jpg'},
  ];

  var queryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<PhotoBloc>().add(GetTrenddingWallpaper());
    // context.read<WallpaperListBloc>().add(GetSearchWallpaper(query: query));
  }

  @override
  Widget build(BuildContext context) {
    listImage.shuffle();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 46, 220, 255),
        body: Stack(
          //* Stack to take a Gradient Color
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffE8D7DA),
                    Color(0xffA0D3D6),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Container(
                        //* Find the Wallpaper search box..
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          color: const Color(0xffDBEBF1),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: TextField(
                          controller: queryController,
                          decoration: InputDecoration(
                            hintText: 'Find Wallpaper..',
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WallpaperList(
                                        mQuery: queryController.text.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.image_search)),
                            suffixIconColor:
                                const Color.fromARGB(255, 172, 172, 172),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffDBEBF1),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffDBEBF1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //* Best if the Month Image
                    const Text(
                      'Best of the month',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 300,
                        child: BlocBuilder<PhotoBloc, PhotoState>(
                            builder: (_, state) {
                          if (state is PhotoLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is PhotoInternetErrorState) {
                            return Center(
                              child: Lottie.asset(
                                'assets/json/internet_error.json',
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            );
                          } else if (state is PhotoErrorState) {
                            return Center(
                              child: Text(state.errMsg),
                            );
                          } else if (state is PhotoLoadedState) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.wallpaperModel.photos!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PhotoViewer(
                                            imgViewer: state.wallpaperModel
                                                .photos![index].src!.original!,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          state.wallpaperModel.photos![index]
                                              .src!.portrait!,
                                        ),
                                      ),
                                    ),
                                    // child: Image.asset(listImage[index]),
                                  ),
                                );
                              },
                            );
                          }

                          return const Center(
                            child: Text('No Data Found'),
                          );
                        })

                        // ListView.builder(
                        //   scrollDirection: Axis.horizontal,
                        //   itemCount: listImage.length,
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       margin: const EdgeInsets.only(right: 20),
                        //       width: 200,
                        //       height: 200,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         image: DecorationImage(
                        //           fit: BoxFit.cover,
                        //           image: AssetImage(
                        //             listImage[index],
                        //           ),
                        //         ),
                        //       ),
                        //       // child: Image.asset(listImage[index]),
                        //     );
                        //   },
                        // ),

                        ),
                    const SizedBox(
                      height: 30,
                    ),

                    //* Color List

                    const Text(
                      'The Color Tone',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listColor.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WallpaperList(
                                    mQuery: queryController.text.isNotEmpty
                                        ? queryController.text.toString()
                                        : 'Nature',
                                    mColor: listColor[index]['code'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: listColor[index]['color'],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //* All Category

                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      itemCount: categoriesName.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 16 / 9,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WallpaperList(
                                      mQuery: categoriesName[index]['name']),
                                )); // if (index == 0) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Natural(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // } else if (index == 1) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Flower(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // } else if (index == 2) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Sports(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // } else if (index == 3) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Film(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // } else if (index == 4) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => StreetPhotography(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // } else if (index == 5) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Animals(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // } else if (index == 6) {
                            //   // Navigator.push(
                            //   //   context,
                            //   //   MaterialPageRoute(
                            //   //     builder: (context) => Scaffold(
                            //   //       appBar: AppBar(
                            //   //         title: categoriesName[index]['name'],
                            //   //       ),
                            //   //     ),
                            //   //   ),
                            //   // );
                            // } else if (index == 7) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Food(
                            //         title: categoriesName[index]['name'],
                            //       ),
                            //     ),
                            //   );
                            // }
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      categoriesName[index]["img_cat"],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  categoriesName[index]['name'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
