import 'package:flutter/material.dart';

class Natural extends StatelessWidget {
  String title;

  Natural({required this.title});

  List listNaturalImage = [
    'assets/images/natural/img_natural16.jpg',
    'assets/images/natural/img_natural15.jpg',
    'assets/images/natural/img_natural14.jpg',
    'assets/images/natural/img_natural13.jpg',
    'assets/images/natural/img_natural12.jpg',
    'assets/images/natural/img_natural11.jpg',
    'assets/images/natural/img_natural10.jpg',
    'assets/images/natural/img_natural9.jpg',
    'assets/images/natural/img_natural8.jpg',
    'assets/images/natural/img_natural7.webp',
    'assets/images/natural/img_natural6.jpg',
    'assets/images/natural/img_natural5.jpg',
    'assets/images/natural/img_natural4.jpg',
    'assets/images/natural/img_natural3.jpg',
    'assets/images/natural/img_natural2.jpg',
    'assets/images/natural/img_natural.jpeg',
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
                '${listNaturalImage.length} wallpaper available',
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
                  itemCount: listNaturalImage.length,
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
                            listNaturalImage[index],
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
