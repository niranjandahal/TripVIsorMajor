import 'package:flutter/material.dart';

class AgencyAddPackage extends StatefulWidget {
  const AgencyAddPackage({Key? key}) : super(key: key);

  @override
  State<AgencyAddPackage> createState() => _AgencyAddPackageState();
}

class _AgencyAddPackageState extends State<AgencyAddPackage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _difficultyController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _day1Controller = TextEditingController();
  final TextEditingController _day2Controller = TextEditingController();
  final TextEditingController _day3Controller = TextEditingController();
  final TextEditingController _day4Controller = TextEditingController();
  final TextEditingController _day5Controller = TextEditingController();
  final TextEditingController _day6Controller = TextEditingController();
  final TextEditingController _day7Controller = TextEditingController();
  final TextEditingController _day8Controller = TextEditingController();
  final TextEditingController _day9Controller = TextEditingController();
  final TextEditingController _day10Controller = TextEditingController();
  final TextEditingController _day11Controller = TextEditingController();
  final TextEditingController _day12Controller = TextEditingController();
  final TextEditingController _day13Controller = TextEditingController();
  final TextEditingController _day14Controller = TextEditingController();
  final TextEditingController _day15Controller = TextEditingController();
  final TextEditingController _clothingController = TextEditingController();
  final TextEditingController _gearController = TextEditingController();
  final TextEditingController _accommodationController =
      TextEditingController();
  final TextEditingController _guideNameController = TextEditingController();
  final TextEditingController _guideExperienceController =
      TextEditingController();
  final TextEditingController _guideKnowledgeController =
      TextEditingController();
  final TextEditingController _porterNameController = TextEditingController();
  final TextEditingController _porterRoleController = TextEditingController();
  final TextEditingController _porterStrengthController =
      TextEditingController();
  final TextEditingController _altitudeSymptomsController =
      TextEditingController();
  final TextEditingController _altitudePreventionController =
      TextEditingController();
  final TextEditingController _medicalFacilitiesController =
      TextEditingController();
  final TextEditingController _travelInsuranceController =
      TextEditingController();
  final TextEditingController _permitsController = TextEditingController();
  final TextEditingController _weatherController = TextEditingController();
  final TextEditingController _communicationController =
      TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _daysRequiredController = TextEditingController();
  final TextEditingController _totalAscentController = TextEditingController();
  final TextEditingController _totalDescentController = TextEditingController();
  final TextEditingController _highestPointController = TextEditingController();
  final TextEditingController _permitsOverviewController =
      TextEditingController();
  final TextEditingController _costPerDayController = TextEditingController();
  final TextEditingController _bestTimeController = TextEditingController();
  final TextEditingController _tipsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Package'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trek Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Basic Information'),
            buildTextField('Name', _nameController),
            buildTextField('Region', _regionController),
            buildTextField('Duration', _durationController),
            buildTextField('Difficulty', _difficultyController),
            buildTextField('Price', _priceController),
            buildTextField('Image URL', _imageController),
            buildTextField('Description', _descriptionController),
            SizedBox(height: 16),
            Text('Itinerary'),
            buildTextField('Day 1', _day1Controller),
            buildTextField('Day 2', _day2Controller),
            buildTextField('Day 3', _day3Controller),
            buildTextField('Day 4', _day4Controller),
            buildTextField('Day 5', _day5Controller),
            // Include more days here
            SizedBox(height: 16),
            Text('What to Pack'),
            buildTextField('Clothing', _clothingController),
            buildTextField('Gear', _gearController),
            SizedBox(height: 16),
            Text('Accommodation'),
            buildTextField('Details', _accommodationController),
            SizedBox(height: 16),
            Text('Guide and Porter'),
            buildTextField('Guide Name', _guideNameController),
            buildTextField('Guide Experience', _guideExperienceController),
            buildTextField('Guide Knowledge', _guideKnowledgeController),
            buildTextField('Porter Name', _porterNameController),
            buildTextField('Porter Role', _porterRoleController),
            buildTextField('Porter Strength', _porterStrengthController),
            SizedBox(height: 16),
            Text('Safety and Health'),
            buildTextField('Altitude Symptoms', _altitudeSymptomsController),
            buildTextField(
                'Altitude Prevention', _altitudePreventionController),
            buildTextField('Medical Facilities', _medicalFacilitiesController),
            buildTextField('Travel Insurance', _travelInsuranceController),
            SizedBox(height: 16),
            Text('Additional Information'),
            buildTextField('Permits', _permitsController),
            buildTextField('Weather', _weatherController),
            buildTextField('Communication', _communicationController),
            SizedBox(height: 16),
            Text('Trek Overview'),
            buildTextField('Distance', _distanceController),
            buildTextField('Days Required', _daysRequiredController),
            buildTextField('Total Ascent', _totalAscentController),
            buildTextField('Total Descent', _totalDescentController),
            buildTextField('Highest Point', _highestPointController),
            buildTextField('Permits Overview', _permitsOverviewController),
            buildTextField('Cost Per Day', _costPerDayController),
            buildTextField('Best Time', _bestTimeController),
            buildTextField('Tips', _tipsController),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        maxLines: null,
      ),
    );
  }
}
