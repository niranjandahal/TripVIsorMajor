import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/offersectionprovider.dart';

class OfferSection3 extends StatefulWidget {
  const OfferSection3({Key? key}) : super(key: key);

  @override
  _OfferSection3State createState() => _OfferSection3State();
}

class _OfferSection3State extends State<OfferSection3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          margin: EdgeInsets.all(20),
          child: Text(
            'Trending Packages',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 400,
          margin: EdgeInsets.all(20),
          // color: Colors.green,
          child: Consumer<offersectionprovider>(
            builder: (context, offerSectionProvider, child) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerSectionProvider.getcounts(2),
                itemBuilder: (context, index) {
                  final offer = offerSectionProvider.offerlist2[index];
                  return Container(
                    width: 300,
                    height: 400,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(offer['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  offer['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Region: ${offer['region']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Duration: ${offer['duration']} days',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Difficulty: ${offer['difficulty']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 10),
                                // Text(
                                //   'Highlights:',
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children:
                                //       (offer['highlights'] as List<String>)
                                //           .map((highlight) => Text(
                                //                 '- $highlight',
                                //                 style: TextStyle(fontSize: 14),
                                //               ))
                                //           .toList(),
                                // ),
                                // SizedBox(height: 10),
                                Text(
                                  'Price: \$${offer['price']}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
