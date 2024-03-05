import 'package:flutter/material.dart';
import 'package:tripvisormajor/entity/Agency/packages/addpackages.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';

class AgencyPanel extends StatefulWidget {
  const AgencyPanel({Key? key}) : super(key: key);

  @override
  State<AgencyPanel> createState() => _AgencyPanelState();
}

class _AgencyPanelState extends State<AgencyPanel> {
  final userAgencyProvider userProvider = userAgencyProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userProvider.AgencyName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgencyAddPackage()));
              },
              child: Text('Add Packages'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Handle view request button press
              },
              child: Text('View Requests'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Handle view added packages button press
              },
              child: Text('View Added Packages'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('update packages'),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
