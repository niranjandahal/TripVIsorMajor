// import 'package:flutter/material.dart';
// import 'package:web_smooth_scroll/web_smooth_scroll.dart';

// child: Consumer<offersectionprovider>(
// builder: (context, offerSectionProvider, child) {

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/packagedetailprovider.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key? key}) : super(key: key);

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => PackageDetailsProvider(),
        child: WebSmoothScroll(
          controller: _scrollController,
          scrollOffset: 60,
          animationDuration: 500,
          curve: Curves.easeInOutCirc,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display trek details
                Consumer<PackageDetailsProvider>(
                  builder: (context, provider, _) {
                    final trekDetails = provider.trekDetailsList.first;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            trekDetails['trek_details']['name'],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Region: ${trekDetails['trek_details']['region']}'),
                              Text(
                                  'Duration: ${trekDetails['trek_details']['duration']} days'),
                              Text(
                                  'Difficulty: ${trekDetails['trek_details']['difficulty']}'),
                            ],
                          ),
                        ),
                        // Display itinerary
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Itinerary',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              for (int i = 1;
                                  i <= trekDetails['itinerary'].length;
                                  i++)
                                Text(
                                    'Day $i: ${trekDetails['itinerary']['day$i']}'),
                            ],
                          ),
                        ),
                        // Display what to pack
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What to Pack',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text('Clothing:'),
                              for (var item in trekDetails['what_to_pack']
                                  ['clothing'])
                                Text('- $item'),
                              Text('Gear:'),
                              for (var item in trekDetails['what_to_pack']
                                  ['gear'])
                                Text('- $item'),
                            ],
                          ),
                        ),
                        // Display accommodation
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Accommodation',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(trekDetails['accommodation']),
                            ],
                          ),
                        ),
                        // Display guide and porter information
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Guide',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  'Name: ${trekDetails['guide_and_porter']['guide']['name']}'),
                              Text(
                                  'Experience: ${trekDetails['guide_and_porter']['guide']['experience']}'),
                              // Add more guide details as needed
                              Text(
                                'Porter',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  'Name: ${trekDetails['guide_and_porter']['porter']['name']}'),
                              // Add more porter details as needed
                            ],
                          ),
                        ),
                        // Add more sections as needed
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
