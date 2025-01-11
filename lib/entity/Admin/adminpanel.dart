import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  // Nested data with agency name and packages in list variable
  List AgencyData = [
    {
      "AgencyName": "Agency1",
      "Packages": [
        {"Package1": "Package1"},
        {"Package2": "Package2"},
        {"Package3": "Package3"},
      ]
    },
    {
      "AgencyName": "Agency2",
      "Packages": [
        {"Package1": "Package1"},
        {"Package2": "Package2"},
        {"Package3": "Package3"},
      ]
    },
    // Add more agency data as needed
  ];

  bool showAgencyListView = true; // Initially show agency list view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showAgencyListView = true; // Show agency list view
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: showAgencyListView
                          ? Colors.blue
                          : Colors.grey, // Text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    child: Text('Delete Agency'),
                  ),
                  SizedBox(width: 100),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showAgencyListView = false; // Show package list view
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: !showAgencyListView
                          ? Colors.blue
                          : Colors.grey, // Text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    child: Text('Delete Packages'),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Conditional rendering of agency or package list view based on button selection
              showAgencyListView
                  ? _buildPackageListView()
                  : _buildAgencyListView()
            ],
          ),
        ),
      ),
    );
  }

  // Method to build the agency list view
  Widget _buildAgencyListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: AgencyData.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  AgencyData[index]["AgencyName"],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    AgencyData[index]["Packages"].length,
                    (index2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AgencyData[index]["Packages"][index2]
                                  .values
                                  .first,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle delete package button press
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                              ),
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Method to build the package list view
  Widget _buildPackageListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: AgencyData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                AgencyData[index]["AgencyName"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Render list of packages for each agency
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: AgencyData[index]["Packages"].length,
                itemBuilder: (context, index2) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          AgencyData[index]["Packages"][index2].values.first,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Render delete button for each package
                        ElevatedButton(
                          onPressed: () {
                            // Handle delete package button press
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                          ),
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
