import 'package:flutter/material.dart';

class Flower extends StatelessWidget {
  String title;

  Flower({required this.title});

  List listFlowerImage = [
    'assets/images/flower/img_flower.jpg',
    'assets/images/flower/img_flower2.jpg',
    'assets/images/flower/img_flower3.jpg',
    'assets/images/flower/img_flower4.avif',
    'assets/images/flower/img_flower5.avif',
    'assets/images/flower/img_flower6.avif',
    'assets/images/flower/img_flower7.avif',
    'assets/images/flower/img_flower8.avif',
    'assets/images/flower/img_flower9.avif',
    'assets/images/flower/img_flower10.avif',
    'assets/images/flower/img_flower11.avif',
    'assets/images/flower/img_flower12.avif',
    // 'assets/images/flower/img_flower13.avif',
    'assets/images/flower/img_flower14.avif',
    'assets/images/flower/img_flower15.avif',
    'assets/images/flower/img_flower16.avif',
    'assets/images/flower/img_flower17.avif',
    'assets/images/flower/img_flower18.avif',
    'assets/images/flower/img_flower19.avif',
    'assets/images/flower/img_flower20.avif',
    'assets/images/flower/img_flower21.avif',
    'assets/images/flower/img_flower22.avif',
    'assets/images/flower/img_flower23.avif',
    'assets/images/flower/img_flower24.avif',
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
                '${listFlowerImage.length} wallpaper available',
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
                  itemCount: listFlowerImage.length,
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
                            listFlowerImage[index],
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
