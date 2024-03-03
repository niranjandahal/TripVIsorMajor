import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

class HomeFullScreenShow extends StatefulWidget {
  const HomeFullScreenShow({super.key});

  @override
  State<HomeFullScreenShow> createState() => _HomeFullScreenShowState();
}

class _HomeFullScreenShowState extends State<HomeFullScreenShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}

      child: CarouselSlider(
        //show same image 5 times
        items: [
          // 'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          // 'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          // 'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          // 'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          // 'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          'https://i0.wp.com/beyondwildplaces.com/wp-content/uploads/2021/11/Trekking-in-Nepal-1.jpg',
          'https://blog.weekendthrill.com/wp-content/uploads/2016/07/1-10.jpg',
          'https://www.nepaltour.info/wp-content/uploads/2016/12/manang-trekking.jpg'
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      i,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.4),
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 -
                        30.0, // Adjust as needed
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Your Text Here',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(height: 8.0),
                        //elevated button with text view details and on hover it the button should change style
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).go('/packagedetails');
                          },
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          aspectRatio: 1,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
