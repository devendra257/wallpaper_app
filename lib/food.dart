import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  String title;

  Food({required this.title});

  List listFoodImage = [
    'assets/images/food/img_food.avif',
    'assets/images/food/img_food1.avif',
    'assets/images/food/img_food2.avif',
    'assets/images/food/img_food3.avif',
    'assets/images/food/img_food4.avif',
    'assets/images/food/img_food5.avif',
    'assets/images/food/img_food6.avif',
    'assets/images/food/img_food7.avif',
    'assets/images/food/img_food9.avif',
    'assets/images/food/img_food10.avif',
    'assets/images/food/img_food11.avif',
    'assets/images/food/img_food12.avif',
    'assets/images/food/img_food13.avif',
    'assets/images/food/img_food14.avif',
    'assets/images/food/img_food15.avif',
    'assets/images/food/img_food16.avif',
    'assets/images/food/img_food17.avif',
    'assets/images/food/img_food18.avif',
    'assets/images/food/img_food19.avif',
    'assets/images/food/img_food20.avif',
    'assets/images/food/img_food21.avif',
    'assets/images/food/img_food22.avif',
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
                '${listFoodImage.length} wallpaper available',
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
                  itemCount: listFoodImage.length,
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
                            listFoodImage[index],
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
