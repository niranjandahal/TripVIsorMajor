import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/packagedetailprovider.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key? key}) : super(key: key);

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trek Details'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PackageDetailsProvider(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<PackageDetailsProvider>(
            builder: (context, provider, _) {
              final trekDetails = provider.trekDetailsList.first;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(trekDetails),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'Highlights',
                      content: trekDetails['trek_details']['highlights']
                          .map<Widget>((highlight) => _buildListItem(highlight))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'Itinerary',
                      content: trekDetails['itinerary']
                          .values
                          .map<Widget>((day) => _buildListItem(day))
                          .toList(),
                    ),
                    // Add other sections similarly
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Map<String, dynamic> trekDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trekDetails['trek_details']['name'],
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            trekDetails['trek_details']['image'],
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Text(
          trekDetails['trek_details']['description'],
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ...content,
      ],
    );
  }

  Widget _buildListItem(String item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        '- $item',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
