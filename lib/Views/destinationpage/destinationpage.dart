import 'package:flutter/material.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  //
  RangeValues _priceRangeValues = RangeValues(0, 3500);
  RangeValues _daysRangeValues = RangeValues(0, 20);
  //
  //
  String _selectedDifficulty = 'All';
  List<Map<String, dynamic>> offerList = [];
  List<Map<String, dynamic>> filteredOfferList = [];

  @override
  void initState() {
    super.initState();
    loadOfferList();
  }

  Future<void> loadOfferList() async {
    if (offerList.isEmpty) {
      // Simulated data
      offerList = [
        {
          "id": "premium1",
          "name": "Luxury Everest Expedition",
          "region": "Khumbu",
          "duration": 20,
          "difficulty": "Challenging",
          "highlights": [
            "Summiting Mount Everest",
            "Luxurious accommodations throughout the trek",
            "Professional cinematographer capturing your journey",
            "Custom drone shots of your trek",
            "Compilation video of your trek after it's over"
          ],
          "price": 10000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Embark on the ultimate luxury trekking experience to Everest Base Camp. This premium package includes sumptuous accommodations, professional cinematography, and drone shots to capture every moment of your journey."
        },
        {
          "id": "premium2",
          "name": "Helicopter Tour of the Himalayas",
          "region": "Various",
          "duration": 1,
          "difficulty": "Easy",
          "highlights": [
            "Scenic helicopter tour of the Himalayas",
            "Aerial views of Mount Everest, Annapurna, and more",
            "Landing at Everest Base Camp or Annapurna Base Camp",
            "Champagne breakfast at the mountain base camp"
          ],
          "price": 5000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Experience the grandeur of the Himalayas on a private helicopter tour. This premium package offers breathtaking aerial views of the world's highest peaks, with the option to land at Everest or Annapurna Base Camp."
        },
        {
          "id": "premium3",
          "name": "Luxury Annapurna Sanctuary Trek",
          "region": "Annapurna",
          "duration": 14,
          "difficulty": "Moderate",
          "highlights": [
            "Sumptuous accommodations and gourmet meals",
            "Professional guide and porter service",
            "Private helicopter transfer to and from the trek",
            "Customized itinerary and personalized service"
          ],
          "price": 8000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Embark on a luxurious trek to the Annapurna Sanctuary, with private helicopter transfers, gourmet meals, and personalized service. This premium package offers the ultimate in comfort and convenience."
        },

        {
          "id": "1",
          "name": "Annapurna Base Camp Trek",
          "region": "Annapurna",
          "duration": 14,
          "difficulty": "Moderate",
          "highlights": [
            "Stunning views of Annapurna I, Machapuchare, and Hiunchuli",
            "Diverse landscapes, from lush valleys to glaciers",
            "Traditional villages and cultural experiences",
            "Opportunity to see unique flora and fauna"
          ],
          "price": 1500,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Embark on a classic journey to the foot of Annapurna I, Nepal's 10th highest peak. This moderate trek offers breathtaking scenery, diverse landscapes, and cultural encounters."
        },
        {
          "id": "2",
          "name": "Everest Base Camp Trek",
          "region": "Khumbu",
          "duration": 16,
          "difficulty": "Challenging",
          "highlights": [
            "Stand at the foot of the world's highest mountain",
            "Experience Sherpa culture and traditions",
            "Witness breathtaking views of the Khumbu Valley and surrounding peaks",
            "Visit Gokyo Lakes and Kala Patthar for panoramic views"
          ],
          "price": 3000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Challenge yourself on this iconic trek to the base camp of Mt. Everest. Experience the beauty and grandeur of the Himalayas, Sherpa culture, and breathtaking panoramas."
        },
        {
          "id": "3",
          "name": "Langtang Valley Trek",
          "region": "Langtang",
          "duration": 10,
          "difficulty": "Moderate",
          "highlights": [
            "Explore the Langtang Valley, known as the 'Valley of Glaciers'",
            "Visit Kyanjin Gompa and Tserko Ri for stunning views",
            "Experience Tamang culture and traditions",
            "Opportunity to see unique flora and fauna"
          ],
          "price": 1200,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Trek through the Langtang Valley, a region known for its natural beauty and cultural diversity. This moderate trek offers stunning views, unique flora and fauna, and cultural experiences."
        },
        {
          "id": "4",
          "name": "Manaslu Circuit Trek",
          "region": "Manaslu",
          "duration": 18,
          "difficulty": "Challenging",
          "highlights": [
            "Trek around the world's eighthhighest peak",
            "Experience diverse landscapes and ecosystems",
            "Cross the challenging Larkya La Pass",
            "Visit traditional villages and monasteries"
          ],
          "price": 2500,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Embark on an off-the-beaten-path adventure around Manaslu, a region known for its natural beauty and cultural diversity. This challenging trek offers stunning views, diverse landscapes, and cultural encounters."
        },
        {
          "id": "5",
          "name": "Upper Mustang Trek",
          "region": "Mustang",
          "duration": 14,
          "difficulty": "Moderate",
          "highlights": [
            "Explore the 'Forbidden Kingdom' of Mustang",
            "Visit ancient monasteries and caves",
            "Experience Tibetan culture and traditions",
            "Witness unique landscapes and rock formations"
          ],
          "price": 2000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Journey to the remote and mystical region of Upper Mustang, known for its ancient monasteries, caves, and unique landscapes. This moderate trek offers a glimpse into a bygone era."
        },

        {
          "id": "offer1",
          "name": "Annapurna Base Camp Trek",
          "region": "Annapurna",
          "duration": 14,
          "difficulty": "Moderate",
          "highlights": [
            "Stunning views of Annapurna I, Machapuchare, and Hiunchuli",
            "Diverse landscapes, from lush valleys to glaciers",
            "Traditional villages and cultural experiences",
            "Opportunity to see unique flora and fauna"
          ],
          "price": 1500,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Embark on a classic journey to the foot of Annapurna I, Nepal's 10th highest peak. This moderate trek offers breathtaking scenery, diverse landscapes, and cultural encounters."
        },
        {
          "id": "offer2",
          "name": "Everest Base Camp Trek",
          "region": "Khumbu",
          "duration": 16,
          "difficulty": "Challenging",
          "highlights": [
            "Stand at the foot of the world's highest mountain",
            "Experience Sherpa culture and traditions",
            "Witness breathtaking views of the Khumbu Valley and surrounding peaks",
            "Visit Gokyo Lakes and Kala Patthar for panoramic views"
          ],
          "price": 3000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Challenge yourself on this iconic trek to the base camp of Mt. Everest. Experience the beauty and grandeur of the Himalayas, Sherpa culture, and breathtaking panoramas."
        },
        {
          "id": "offer3",
          "name": "Langtang Valley Trek",
          "region": "Langtang",
          "duration": 10,
          "difficulty": "Moderate",
          "highlights": [
            "Explore the Langtang Valley, known as the 'Valley of Glaciers'",
            "Visit Kyanjin Gompa and Tserko Ri for stunning views",
            "Experience Tamang culture and traditions",
            "Opportunity to see unique flora and fauna"
          ],
          "price": 1200,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Trek through the Langtang Valley, a region known for its natural beauty and cultural diversity. This moderate trek offers stunning views, unique flora and fauna, and cultural experiences."
        },
        {
          "id": "offer4",
          "name": "Manaslu Circuit Trek",
          "region": "Manaslu",
          "duration": 18,
          "difficulty": "Challenging",
          "highlights": [
            "Trek around the world's eighthhighest peak",
            "Experience diverse landscapes and ecosystems",
            "Cross the challenging Larkya La Pass",
            "Visit traditional villages and monasteries"
          ],
          "price": 2500,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Embark on an off-the-beaten-path adventure around Manaslu, a region known for its natural beauty and cultural diversity. This challenging trek offers stunning views, diverse landscapes, and cultural encounters."
        },
        {
          "id": "offer5",
          "name": "Upper Mustang Trek",
          "region": "Mustang",
          "duration": 14,
          "difficulty": "Moderate",
          "highlights": [
            "Explore the 'Forbidden Kingdom' of Mustang",
            "Visit ancient monasteries and caves",
            "Experience Tibetan culture and traditions",
            "Witness unique landscapes and rock formations"
          ],
          "price": 2000,
          "image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQks-8u2-wtDvBupaGzpoyLx4ap5Pf-vGICAXxynGS7PA&s",
          "description":
              "Journey to the remote and mystical region of Upper Mustang, known for its ancient monasteries, caves, and unique landscapes. This moderate trek offers a glimpse into a bygone era."
        }

        // Add more package data with image URLs
      ];
      // Initially, filtered list will be the same as the offer list
      filteredOfferList = List.from(offerList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Destination'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFilters(),
                SizedBox(height: 16.0),
                Text(
                  'Available Packages',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                _buildPackageList(),
              ],
            ),
          ),
        ));
  }

  Widget _buildFilters() {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter Packages',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text('Price Range:'),
          RangeSlider(
            values: _priceRangeValues,
            min: 0,
            max: 3500,
            divisions: 35,
            labels: RangeLabels(
              '\$${_priceRangeValues.start.round()}',
              '\$${_priceRangeValues.end.round()}',
            ),
            onChanged: (values) {
              setState(() {
                _priceRangeValues = values;
                _applyFilters();
              });
            },
          ),
          SizedBox(height: 16.0),
          Text('Days Range:'),
          RangeSlider(
            values: _daysRangeValues,
            min: 0,
            max: 20,
            divisions: 20,
            labels: RangeLabels(
              '${_daysRangeValues.start.round()} days',
              '${_daysRangeValues.end.round()} days',
            ),
            onChanged: (values) {
              setState(() {
                _daysRangeValues = values;
                _applyFilters();
              });
            },
          ),
          SizedBox(height: 16.0),
          Text('Difficulty Level:'),
          DropdownButton<String>(
            value: _selectedDifficulty,
            onChanged: (String? newValue) {
              setState(() {
                _selectedDifficulty = newValue!;
                _applyFilters();
              });
            },
            items: <String>['All', 'Easy', 'Moderate', 'Challenging']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Apply filters here
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageList() {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: filteredOfferList.map((package) {
          return GestureDetector(
            onTap: () {
              print(package['Image'].toString());
              // Handle package tap, you can navigate to package details page here
              // For now, just print the package name
              print('Package tapped: ${package['name']}');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              elevation: 4.0,
              child: SizedBox(
                width: 200,
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            // Network image
                            image: NetworkImage(
                              package['image'] ??
                                  'https://via.placeholder.com/150',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              package['name'],
                              style: TextStyle(
                                color:  Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Price: \$${package['price']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Duration: ${package['duration']} days',
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Difficulty: ${package['difficulty']}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _applyFilters() {
    filteredOfferList = offerList.where((package) {
      double price = package['price'];
      double duration = package['duration'];
      bool priceInRange =
          price >= _priceRangeValues.start && price <= _priceRangeValues.end;
      bool durationInRange = duration >= _daysRangeValues.start &&
          duration <= _daysRangeValues.end;
      bool difficultyMatches = _selectedDifficulty == 'All' ||
          package['difficulty'] == _selectedDifficulty;
      return priceInRange && durationInRange && difficultyMatches;
    }).toList();
    setState(() {});
  }
}
