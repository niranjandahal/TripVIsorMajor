import 'package:flutter/material.dart';

class AgencyAddPackage extends StatefulWidget {
  @override
  _AgencyAddPackageState createState() => _AgencyAddPackageState();
}

class _AgencyAddPackageState extends State<AgencyAddPackage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _difficultyController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _dayController = TextEditingController();
  TextEditingController _highlightController = TextEditingController();
  TextEditingController _clothingItemController =
      TextEditingController(); // Separate controller for clothing item
  TextEditingController _gearItemController =
      TextEditingController(); // Separate controller for gear item
  TextEditingController _responsibilityController = TextEditingController();
  TextEditingController _responsibilityDescriptionController =
      TextEditingController();
  TextEditingController _symptomController = TextEditingController();

  TextEditingController _accommodationcontroller = TextEditingController();

  // TextControllers for the guide_and_porter section
  final TextEditingController _guideNameController = TextEditingController();
  final TextEditingController _guideExperienceController =
      TextEditingController();
  final TextEditingController _guideKnowledgeController =
      TextEditingController();
  final TextEditingController _guideResponsibilitiesController =
      TextEditingController();
  final TextEditingController _porterNameController = TextEditingController();
  final TextEditingController _porterRoleController = TextEditingController();
  final TextEditingController _porterStrengthController =
      TextEditingController();
  final TextEditingController _porterResponsibilitiesController =
      TextEditingController();

  // TextControllers for the safety_and_health section
  final TextEditingController _altitudeSymptomsController =
      TextEditingController();
  final TextEditingController _altitudePreventionController =
      TextEditingController();
  final TextEditingController _medicalFacilitiesController =
      TextEditingController();
  final TextEditingController _travelInsuranceController =
      TextEditingController();

  // TextControllers for the additional_information section
  final TextEditingController _permitsController = TextEditingController();
  final TextEditingController _weatherController = TextEditingController();
  final TextEditingController _communicationController =
      TextEditingController();

  // TextControllers for the trek_overview section
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _daysRequiredController = TextEditingController();
  final TextEditingController _totalAscentController = TextEditingController();
  final TextEditingController _totalDescentController = TextEditingController();
  final TextEditingController _highestPointController = TextEditingController();
  final TextEditingController _costPerDayController = TextEditingController();
  final TextEditingController _guideRequirementController =
      TextEditingController();
  final TextEditingController _accommodationController =
      TextEditingController();
  final TextEditingController _bestTimeController = TextEditingController();
  final TextEditingController _tipsController = TextEditingController();

  List<String> _highlights = [];
  List<String> _itinerary = [];
  List<String> _clothing = [];
  List<String> _gear = [];
  List<String> _symptoms = [];
  List<Map<String, dynamic>> _responsibilities = [];

  void _addHighlight() {
    setState(() {
      _highlights.add(_highlightController.text);
      _highlightController.clear();
    });
  }

  void _addItinerary() {
    setState(() {
      _itinerary.add(_dayController.text);
      _dayController.clear();
    });
  }

  void _addItem(String type) {
    setState(() {
      if (type == 'clothing') {
        _clothing.add(_clothingItemController.text);
        _clothingItemController
            .clear(); // Clear the controller after adding the item
      } else if (type == 'gear') {
        _gear.add(_gearItemController.text);
        _gearItemController
            .clear(); // Clear the controller after adding the item
      }
    });
  }

  void _addResponsibility() {
    setState(() {
      _responsibilities.add({
        'responsibility': _responsibilityController.text,
        'description': _responsibilityDescriptionController.text,
      });
      _responsibilityController.clear();
      _responsibilityDescriptionController.clear();
    });
  }

  void _addSymptom() {
    setState(() {
      _symptoms.add(_symptomController.text);
      _symptomController.clear();
    });
  }

  void _savePackage() {
    // Create the package data
    Map<String, dynamic> package = {
      'trek_details': {
        'name': _nameController.text,
        'region': _regionController.text,
        'duration': int.tryParse(_durationController.text) ?? 0,
        'difficulty': _difficultyController.text,
        'highlights': _highlights,
        'price': double.tryParse(_priceController.text) ?? 0,
        'image': _imageController.text,
        'description': _descriptionController.text,
      },
      'itinerary': _itinerary,
      'what_to_pack': {
        'clothing': _clothing,
        'gear': _gear,
      },
      'accommodation': _accommodationcontroller.text,
      "guide_and_porter": {
        "guide": {
          "name": _guideNameController.text,
          "experience": _guideExperienceController.text,
          "knowledge": _guideKnowledgeController.text,
          "responsibilities": _guideResponsibilitiesController.text,
        },
        "porter": {
          "name": _porterNameController.text,
          "role": _porterRoleController.text,
          "strength": _porterStrengthController.text,
          "responsibilities": _porterResponsibilitiesController.text,
        }
      },
      "safety_and_health": {
        "altitude_sickness": {
          "symptoms": _altitudeSymptomsController.text,
          "prevention": _altitudePreventionController.text,
        },
        "medical_facilities": _medicalFacilitiesController.text,
        "travel_insurance": _travelInsuranceController.text,
      },
      "additional_information": {
        "permits": _permitsController.text,
        "weather": _weatherController.text,
        "communication": _communicationController.text,
      },
      "trek_overview": {
        "distance": _distanceController.text,
        "days_required": _daysRequiredController.text,
        "total_ascent": _totalAscentController.text,
        "total_descent": _totalDescentController.text,
        "highest_point": _highestPointController.text,
        "difficulty": _difficultyController.text,
        "cost_per_day": _costPerDayController.text,
        "guide": _guideRequirementController.text,
        "accommodation": _accommodationController.text,
        "best_time": _bestTimeController.text,
        "tips": _tipsController.text,
      }
    };

    print(package);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add packages'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Trek Name'),
            ),
            TextField(
              controller: _regionController,
              decoration: InputDecoration(labelText: 'Region'),
            ),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Duration'),
            ),
            TextField(
              controller: _difficultyController,
              decoration: InputDecoration(labelText: 'Difficulty'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 40.0),
            Text(
              'Highlights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                for (int i = 0; i < _highlights.length; i++)
                  ListTile(
                    title: Text(_highlights[i]),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _highlightController,
                        decoration: InputDecoration(labelText: 'Add Highlight'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: _addHighlight,
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Itinerary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < _itinerary.length; i++)
                  ListTile(
                    title: Text(_itinerary[i]),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _dayController,
                        decoration: InputDecoration(labelText: 'Add Day'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: _addItinerary,
                  child: Icon(
                    Icons.add,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Text(
              'What to Pack',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Text('Clothing',
                    style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
                Column(
                  children: [
                    for (int i = 0; i < _clothing.length; i++)
                      ListTile(
                        title: Text(_clothing[i]),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _clothingItemController,
                            decoration: InputDecoration(labelText: 'Add Item'),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => _addItem('clothing'),
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60.0),
                Text('Gear',
                    style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
                Column(
                  children: [
                    for (int i = 0; i < _gear.length; i++)
                      ListTile(
                        title: Text(_gear[i]),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _gearItemController,
                            decoration: InputDecoration(labelText: 'Add Item'),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => _addItem('gear'),
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Text(
              'Accommodation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _accommodationcontroller,
              decoration: InputDecoration(labelText: 'Accommodation'),
            ),
            SizedBox(height: 40.0),
            Text('Guide and Porter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 40.0),
            TextField(
              controller: _guideNameController,
              decoration: InputDecoration(labelText: 'Guide Name'),
            ),
            TextField(
              controller: _guideExperienceController,
              decoration: InputDecoration(labelText: 'Guide Experience'),
            ),
            TextField(
              controller: _guideKnowledgeController,
              decoration: InputDecoration(labelText: 'Guide Knowledge'),
            ),
            TextField(
              controller: _guideResponsibilitiesController,
              decoration: InputDecoration(labelText: 'Guide Responsibilities'),
            ),
            TextField(
              controller: _porterNameController,
              decoration: InputDecoration(labelText: 'Porter Name'),
            ),
            TextField(
              controller: _porterRoleController,
              decoration: InputDecoration(labelText: 'Porter Role'),
            ),
            TextField(
              controller: _porterStrengthController,
              decoration: InputDecoration(labelText: 'Porter Strength'),
            ),
            TextField(
              controller: _porterResponsibilitiesController,
              decoration: InputDecoration(labelText: 'Porter Responsibilities'),
            ),
            SizedBox(height: 20.0),

            // UI for safety_and_health section
            Text("Safety and Health",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            TextField(
              controller: _altitudeSymptomsController,
              decoration:
                  InputDecoration(labelText: 'Altitude Sickness Symptoms'),
            ),
            TextField(
              controller: _altitudePreventionController,
              decoration:
                  InputDecoration(labelText: 'Altitude Sickness Prevention'),
            ),
            TextField(
              controller: _medicalFacilitiesController,
              decoration: InputDecoration(labelText: 'Medical Facilities'),
            ),
            TextField(
              controller: _travelInsuranceController,
              decoration: InputDecoration(labelText: 'Travel Insurance'),
            ),
            SizedBox(height: 20.0),

            // UI for additional_information section
            Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _permitsController,
              decoration: InputDecoration(labelText: 'Permits'),
            ),
            TextField(
              controller: _weatherController,
              decoration: InputDecoration(labelText: 'Weather'),
            ),
            TextField(
              controller: _communicationController,
              decoration: InputDecoration(labelText: 'Communication'),
            ),
            SizedBox(height: 20.0),
            // UI for trek_overview section
            Text(
              "Trek Overview",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _distanceController,
              decoration: InputDecoration(labelText: 'Distance'),
            ),
            TextField(
              controller: _daysRequiredController,
              decoration: InputDecoration(labelText: 'Days Required'),
            ),
            TextField(
              controller: _totalAscentController,
              decoration: InputDecoration(labelText: 'Total Ascent'),
            ),
            TextField(
              controller: _totalDescentController,
              decoration: InputDecoration(labelText: 'Total Descent'),
            ),
            TextField(
              controller: _highestPointController,
              decoration: InputDecoration(labelText: 'Highest Point'),
            ),
            TextField(
              controller: _difficultyController,
              decoration: InputDecoration(labelText: 'Difficulty'),
            ),
            TextField(
              controller: _costPerDayController,
              decoration: InputDecoration(labelText: 'Cost Per Day'),
            ),
            TextField(
              controller: _guideRequirementController,
              decoration: InputDecoration(labelText: 'Guide Requirement'),
            ),
            TextField(
              controller: _accommodationController,
              decoration: InputDecoration(labelText: 'Accommodation'),
            ),
            TextField(
              controller: _bestTimeController,
              decoration: InputDecoration(labelText: 'Best Time'),
            ),
            TextField(
              controller: _tipsController,
              decoration: InputDecoration(labelText: 'Tips'),
            ),
            SizedBox(height: 20.0),

            // Button to save package
            ElevatedButton(
              onPressed: _savePackage,
              child: Text('Save Package'),
            ),
          ],
        ),
      ),
    );
  }
}

//             const SizedBox(height: 40.0),
//             ElevatedButton(
//               onPressed: _savePackage,
//               child: Text('Save Package'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
