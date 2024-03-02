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
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'What to Pack',
                      content: [
                        _buildSubSection(
                          title: 'Clothing',
                          content: trekDetails['what_to_pack']['clothing']
                              .map<Widget>((item) => _buildListItem(item))
                              .toList(),
                        ),
                        _buildSubSection(
                          title: 'Gear',
                          content: trekDetails['what_to_pack']['gear']
                              .map<Widget>((item) => _buildListItem(item))
                              .toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'Accommodation',
                      content: [_buildListItem(trekDetails['accommodation'])],
                    ),
                    SizedBox(height: 20),
                    _buildGuideAndPorterSection(
                      trekDetails['guide_and_porter']['guide'],
                      trekDetails['guide_and_porter']['porter'],
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'Safety & Health',
                      content: [
                        _buildSubSection(
                          title: 'Altitude Sickness Symptoms',
                          content: trekDetails['safety_and_health']
                                  ['altitude_sickness']['symptoms']
                              .map<Widget>((symptom) => _buildListItem(symptom))
                              .toList(),
                        ),
                        _buildSubSection(
                          title: 'Altitude Sickness Prevention',
                          content: [
                            _buildListItem(trekDetails['safety_and_health']
                                ['altitude_sickness']['prevention'])
                          ],
                        ),
                        _buildListItem(trekDetails['safety_and_health']
                            ['medical_facilities']),
                        _buildListItem(trekDetails['safety_and_health']
                            ['travel_insurance']),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'Additional Information',
                      content: [
                        _buildSubSection(
                          title: 'Permits',
                          content: trekDetails['additional_information']
                                  ['permits']
                              .map<Widget>((permit) => _buildListItem(permit))
                              .toList(),
                        ),
                        _buildListItem(
                            trekDetails['additional_information']['weather']),
                        _buildListItem(trekDetails['additional_information']
                            ['communication']),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      title: 'Trek Overview',
                      content: [
                        _buildListItem(
                            'Distance: ${trekDetails['trek_overview']['distance']}'),
                        _buildListItem(
                            'Days Required: ${trekDetails['trek_overview']['days_required']}'),
                        _buildListItem(
                            'Total Ascent: ${trekDetails['trek_overview']['total_ascent']}'),
                        _buildListItem(
                            'Total Descent: ${trekDetails['trek_overview']['total_descent']}'),
                        _buildListItem(
                            'Highest Point: ${trekDetails['trek_overview']['highest_point']}'),
                        _buildListItem(
                            'Difficulty: ${trekDetails['trek_overview']['difficulty']}'),
                        _buildListItem(
                            'Permits: ${trekDetails['trek_overview']['permits']}'),
                        _buildListItem(
                            'Cost Per Day: ${trekDetails['trek_overview']['cost_per_day']}'),
                        _buildListItem(
                            'Guide: ${trekDetails['trek_overview']['guide']}'),
                        _buildListItem(
                            'Accommodation: ${trekDetails['trek_overview']['accommodation']}'),
                        _buildListItem(
                            'Best Time: ${trekDetails['trek_overview']['best_time']}'),
                        _buildListItem(
                            'Tips: ${trekDetails['trek_overview']['tips']}'),
                      ],
                    ),
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
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
        ),
      ),
    );
  }

  Widget _buildSubSection({
    required String title,
    required List<Widget> content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
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

  Widget _buildGuideAndPorterSection(
      Map<String, dynamic> guide, Map<String, dynamic> porter) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guide & Porter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                'Guide: ${guide['name']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Experience: ${guide['experience']}'),
                  Text('Responsibilities:'),
                  ...guide['responsibilities']
                      .map<Widget>((res) => Text('- $res')),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Porter: ${porter['name']}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Role: ${porter['role']}'),
                  Text('Strength: ${porter['strength']}'),
                  Text('Responsibilities:'),
                  ...porter['responsibilities']
                      .map<Widget>((res) => Text('- $res')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
