import 'package:flutter/material.dart';

class Film extends StatelessWidget {
  String title;

  Film({required this.title});

  List listFilmImage = [
    'assets/images/film/img_film.jpg',
    'assets/images/film/img_film2.jpg',
    'assets/images/film/img_film3.jpg',
    'assets/images/film/img_film4.avif',
    'assets/images/film/img_film5.avif',
    'assets/images/film/img_film6.avif',
    'assets/images/film/img_film7.webp',
    'assets/images/film/img_film8.jpg',
    'assets/images/film/img_film9.webp',
    'assets/images/film/img_film10.png',
    'assets/images/film/img_film11.webp',
    'assets/images/film/img_film12.jpg',
    'assets/images/film/img_film13.jpeg',
    'assets/images/film/img_film14.png',
    'assets/images/film/img_film15.webp',
    'assets/images/film/img_film16.png',
    'assets/images/film/img_film17.jpg',
    'assets/images/film/img_film18.avif',
    'assets/images/film/img_film19.jpg',
    'assets/images/film/img_film20.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // backgroundColor: Color(0xffD8EBED),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${listFilmImage.length} wallpaper available',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Image of the natural element
              Expanded(
                child: GridView.builder(
                  itemCount: listFilmImage.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            listFilmImage[index],
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
      ),
    );
  }
}
