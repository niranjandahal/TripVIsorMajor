import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/Components/customText.dart';
import 'package:tripvisormajor/provider/Offersectionprovider.dart';

class OfferSection1 extends StatelessWidget {
  const OfferSection1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Offersectionprovider>(
      builder: (context, Offersectionprovider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            customText(
              'Featured Trips',
              30,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: Offersectionprovider.offerlist1
                  .map((offer) => OfferCard(offer: offer))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class OfferCard extends StatelessWidget {
  final Map<String, dynamic> offer;

  OfferCard({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              offer['image'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: Color(0xFFFFC454).withOpacity(0.3),
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    offer['name'],
                    16,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      customText(
                        offer['region'],
                        14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      customText(
                        '${offer['duration']} days',
                        14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.terrain, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      customText(
                        offer['difficulty'],
                        14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        'Highlights:',
                        14,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 4),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          offer['highlights'].length,
                          (index) => customText(
                            '- ${offer['highlights'][index]}',
                            14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  //line divider
                  Divider(),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            'Starting from',
                            14,
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              customText(
                                '\$${offer['price']}',
                                16,
                                color: Colors.green,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(width: 4),
                              customText(
                                  // '\$${offer['oldprice']}',
                                  "200",
                                  14,
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                  cusdecoration: TextDecoration.lineThrough),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          customText(
                            // '(${offer['rating']})',
                            'based on 200 review',
                            14,
                            color: Colors.white,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                // Implement action
              },
              child: customText(
                'Book Now',
                14,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFC454).withOpacity(1),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
