import 'package:flutter/material.dart';
import 'package:wallpaper_app/animals.dart';
import 'package:wallpaper_app/film.dart';
import 'package:wallpaper_app/flower.dart';
import 'package:wallpaper_app/food.dart';

import 'package:wallpaper_app/sports.dart';
import 'package:wallpaper_app/street_photography.dart';

import 'natural.dart';

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
    Colors.blueAccent[400],
    Colors.redAccent[400],
    Colors.greenAccent[400],
    Colors.amber,
    Colors.deepOrange,
    Colors.amberAccent,
    Colors.black,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.orange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.purple,
    Colors.lightBlue,
    Colors.pink,
    Colors.lime,
    Colors.teal,
    Colors.tealAccent
  ];

  List<Map<String, dynamic>> categoriesName = [
    {
      'name': "Nature",
      'img_cat': 'assets/images/natural/img_natural12.jpg',
    },
    {
      'name': "Flowers",
      'img_cat': 'assets/images/flower/img_flower23.avif',
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
    // {'name': "Flowers", 'img_cat': 'assets/images/img_natural13.jpg'},
  ];
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
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Find Wallpaper..',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            suffixIcon: Icon(Icons.image_search),
                            suffixIconColor: Color.fromARGB(255, 172, 172, 172),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffDBEBF1),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  listImage[index],
                                ),
                              ),
                            ),
                            // child: Image.asset(listImage[index]),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //* Color List

                    const Text(
                      'The color tone',
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
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: listColor[index],
                              borderRadius: BorderRadius.circular(10),
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
                    Container(
                      height: 500,
                      padding: const EdgeInsets.only(right: 5),
                      child: GridView.builder(
                        itemCount: categoriesName.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 16 / 9,
                        ),
                        itemBuilder: (Context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Natural(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              } else if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Flower(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              } else if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sports(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              } else if (index == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Film(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              } else if (index == 4) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StreetPhotography(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              } else if (index == 5) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Animals(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              } else if (index == 6) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Scaffold(
                                //       appBar: AppBar(
                                //         title: categoriesName[index]['name'],
                                //       ),
                                //     ),
                                //   ),
                                // );
                              } else if (index == 7) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Food(
                                      title: categoriesName[index]['name'],
                                    ),
                                  ),
                                );
                              }
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
                      ),
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
