import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/backend/urlapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeFullScreenShow extends StatefulWidget {
  const HomeFullScreenShow({Key? key}) : super(key: key);

  @override
  State<HomeFullScreenShow> createState() => _HomeFullScreenShowState();
}

class _HomeFullScreenShowState extends State<HomeFullScreenShow> {

  List<String> images = [];

  Future<void> getHomeImages() async {
    // Your backend API endpoint for fetching images
    String apiUrl = gethomepageimages;
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Decode the response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Extract the image URL from the response
        String imageUrl = responseData['image_url'];

        // Add the image URL to the list of images
        setState(() {
          images.add(imageUrl);
        });
      } else {
        print("Invalid status code: ${response.statusCode}");
      }
    } catch (error) {
      // Handle errors such as connection issues
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    getHomeImages();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await getHomeImages();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          items: images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () async {
                    // Reload images when tapped
                    await getHomeImages();
                  },
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.4),
                      colorBlendMode: BlendMode.darken,
                      errorBuilder: (context, error, stackTrace) {
                        return Text('Error loading image');
                      },
                    ),
                  ),
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
      ),
    );
  }
}
