import 'package:flutter/material.dart';

class Animals extends StatelessWidget {
  String title;

  Animals({required this.title});

  List listAnimalsImage = [
    'assets/images/animals/img_animals.avif',
    'assets/images/animals/img_animals2.avif',
    'assets/images/animals/img_animals3.avif',
    'assets/images/animals/img_animals4.avif',
    'assets/images/animals/img_animals5.avif',
    'assets/images/animals/img_animals6.avif',
    'assets/images/animals/img_animals7.avif',
    'assets/images/animals/img_animals8.avif',
    'assets/images/animals/img_animals9.avif',
    'assets/images/animals/img_animals10.avif',
    'assets/images/animals/img_animals11.avif',
    'assets/images/animals/img_animals12.avif',
    'assets/images/animals/img_animals13.avif',
    'assets/images/animals/img_animals14.avif',
    'assets/images/animals/img_animals15.avif',
    'assets/images/animals/img_animals16.avif',
    'assets/images/animals/img_animals17.avif',
    'assets/images/animals/img_animals18.avif',
    'assets/images/animals/img_animals19.avif',
    'assets/images/animals/img_animals20.avif',
    'assets/images/animals/img_animals21.avif',
    'assets/images/animals/img_animals22.avif',
    'assets/images/animals/img_animals23.avif',
    'assets/images/animals/img_animals24.avif',
    'assets/images/animals/img_animals25.avif',
    'assets/images/animals/img_animals26.avif',
    'assets/images/animals/img_animals27.avif',
    'assets/images/animals/img_animals28.avif',
    'assets/images/animals/img_animals29.avif',
    'assets/images/animals/img_animals30.avif',
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
                '${listAnimalsImage.length} wallpaper available',
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
                  itemCount: listAnimalsImage.length,
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
                            listAnimalsImage[index],
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
