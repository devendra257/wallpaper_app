import 'package:flutter/material.dart';

class Sports extends StatelessWidget {
  String title;

  Sports({required this.title});

  List listSportsImage = [
    'assets/images/sports/img_sports.avif',
    'assets/images/sports/img_sports2.avif',
    'assets/images/sports/img_sports3.avif',
    'assets/images/sports/img_sports4.avif',
    'assets/images/sports/img_sports5.avif',
    'assets/images/sports/img_sports6.avif',
    'assets/images/sports/img_sports7.avif',
    'assets/images/sports/img_sports8.avif',
    'assets/images/sports/img_sports9.avif',
    'assets/images/sports/img_sports10.avif',
    'assets/images/sports/img_sports11.avif',
    // 'assets/images/sports/img_sports12.avif',
    'assets/images/sports/img_sports13.avif',
    'assets/images/sports/img_sports14.avif',
    'assets/images/sports/img_sports15.avif',
    'assets/images/sports/img_sports16.avif',
    'assets/images/sports/img_sports17.avif',
    'assets/images/sports/img_sports18.avif',
    'assets/images/sports/img_sports19.avif',
    'assets/images/sports/img_sports20.avif',
    'assets/images/sports/img_sports21.avif',
    'assets/images/sports/img_sports22.avif',
    'assets/images/sports/img_sports24.avif',
    // 'assets/images/sports/img_sports22.avif',
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
                style:const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
             const SizedBox(
                height: 10,
              ),
              Text(
                '${listSportsImage.length} wallpaper available',
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
                  itemCount: listSportsImage.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            listSportsImage[index],
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
