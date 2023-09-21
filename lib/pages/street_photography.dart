import 'package:flutter/material.dart';

class StreetPhotography extends StatelessWidget {
  String title;

  StreetPhotography({required this.title});

  List listStreetImage = [
    'assets/images/street/img_street.avif',
    'assets/images/street/img_street2.avif',
    'assets/images/street/img_street3.avif',
    'assets/images/street/img_street4.avif',
    'assets/images/street/img_street5.avif',
    'assets/images/street/img_street6.avif',
    'assets/images/street/img_street7.avif',
    'assets/images/street/img_street8.avif',
    'assets/images/street/img_street9.avif',
    'assets/images/street/img_street10.avif',
    'assets/images/street/img_street11.avif',
    'assets/images/street/img_street12.avif',
    'assets/images/street/img_street13.avif',
    'assets/images/street/img_street14.avif',
    'assets/images/street/img_street15.avif',
    'assets/images/street/img_street16.avif',
    'assets/images/street/img_street17.avif',
    'assets/images/street/img_street18.avif',
    'assets/images/street/img_street19.avif',
    'assets/images/street/img_street20.avif',
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
                '${listStreetImage.length} wallpaper available',
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
                  itemCount: listStreetImage.length,
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
                            listStreetImage[index],
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
