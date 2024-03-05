import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/Widgets/footer.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection1.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection2.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection3.dart';
import 'package:tripvisormajor/backend/urlapi.dart';
import 'package:tripvisormajor/entity/user/packages/bookpackage.dart';
import 'package:tripvisormajor/provider/geminichatprovider.dart';
import 'package:tripvisormajor/provider/packagedetailprovider.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';

class PackageDetails extends StatefulWidget {
  final String pid;
  PackageDetails({Key? key, required this.pid}) : super(key: key);

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  final userAgencyProvider userProvider = userAgencyProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 0,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //print id
                      child: Column(
                        children: [
                          Text('Package ID: ${widget.pid}'),
                          Text('User ID: ${userProvider.userid}'),
                        ],
                      ),
                    ),
                    _buildHeader(context, trekDetails),
                    SizedBox(height: 40),
//*************************************************/
                    //end of header
//*************************************************/
//*************************************************/
                    //start of partioned row 3 2
//*************************************************/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
//*************************************************/
                          //start of first column ratio 3
//*************************************************/
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Added this line
                            children: [
//*************************************************/
                              //tags button
//*************************************************/
                              Container(
                                height: 100,
                                child: Wrap(
                                  spacing: 10.0, // Add spacing between buttons
                                  children: List.generate(
                                      provider.detailstags.length, (index) {
                                    final isSelected =
                                        provider.selectedIndex == index;
                                    return GestureDetector(
                                      onTap: () {
                                        provider.updateSelectedIndex(index);
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.blue
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            provider.detailstags[index],
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
//*************************************************/
                              //selected tags content
//*************************************************/
                              const SizedBox(height: 16),
                              //if selected value is 0 return trekoverview
                              _selecteddetails(
                                  context, provider.selectedIndex, trekDetails),
//*************************************************/
                              //footer section
//*************************************************/
                            ],
                          ),
                        ),
//*************************************************/
//*************************************************/
                        Expanded(
                          flex: 2,
//*************************************************/
                          //start of the second colum from partioned ratio 2
//*************************************************/

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Added this line
                            children: [
//*************************************************/
                              //permit section
//*************************************************/
                              _buildtrek_overview(context, trekDetails),
                              // _buildadditional_information(
                              //     context, trekDetails),
                              // _buildaccomodation(context,
                              //     trekDetails['additional_information']),
                              // _buildguide_and_porter(
                              //     context, trekDetails['guide_and_porter']),
                              // _buildsafety_and_health(
                              //     context, trekDetails['safety_and_health']),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //********************************************* */
                    //********************************************* */
                    //end of the first row
                    //********************************************* */
                    //********************************************* */
                    const SizedBox(height: 20),
                    _similarpackages(),
                    const SizedBox(height: 20),

                    _recommendedpackages(),
                    const SizedBox(height: 20),

                    CustomFooter(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: ChatPopup(),
    );
  }

  Widget _selecteddetails(
      context, int selectedIndex, Map<String, dynamic> trekDetails) {
    switch (selectedIndex) {
      case 0:
        return _buildTrekOverview(context, trekDetails);
      case 1:
        return _buildItinerary(context, trekDetails);
      case 2:
        return _buildHighlights(context, trekDetails);
      case 3:
        return _buildWhatToPack(context, trekDetails);
      default:
        return _buildTrekOverview(context, trekDetails);
    }
  }

  Widget _buildHeader(context, Map<String, dynamic> trekDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          trekDetails['trek_details']['name'],
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40),
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the top
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.network(
                  'https://media.istockphoto.com/id/695677904/photo/signpost-way-to-m-t-everest-b-c.webp?b=1&s=170667a&w=0&k=20&c=H0bFq5-4_Ahkgt5KjHH2kod-BoqKhizJHGs2cCsZw7Q=',
                  width: 200, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //
            const SizedBox(
              width: 50,
            ),
            //beautiful card with 10% off and below from $1000 stroke to $900 and bwloe check availability button and a very short details about trekking
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 500,
              margin: EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 225,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://peoplesblog.co.in/upload/banners/solo-everest-base-camp-trek-what-to-pack.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //red container with low opacity and text 10 % off
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.red.withOpacity(0.2),
                            child: Text(
                              '10% OFF',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'from',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                '\$1000',
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          //text with discounted price
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Price: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' \$900 /',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Adult',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          //button with check availability
                          ElevatedButton(
                            onPressed: () {
                              //book page with pid as parameter
                              print(trekDetails['trek_details']['id']);
                              // GoRouter.of(context).go(
                              //     '/bookpackage/${trekDetails['trek_details']['id']}');
                              // GoRouter.of(context).go(
                              //     '/bookpackage/${trekDetails['trek_details']['id']}');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookPackages(
                                      pid: widget.pid,
                                      uid: userProvider.userid,
                                    ),
                                  ));
                            },
                            child: Text('Book Packages',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(500, 40),
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: 80,
                                vertical: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //text with need help with booking ? send us a message with link for last part only
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Need help with booking?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ChangeNotifierProvider<
                                          GeminiChatProvider>(
                                        create: (_) => GeminiChatProvider(),
                                        child: ChatDialog(),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Send us a message',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //end of card
          ],
        ),
        SizedBox(height: 40),
        Text(
          trekDetails['trek_details']['description'],
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  _buildtrek_overview(BuildContext context, Map<String, dynamic> trekDetails) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trek Overview",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildDetailItem(
              "Distance", trekDetails['trek_overview']["distance"] ?? ""),
          _buildDetailItem("Days Required",
              trekDetails['trek_overview']["days_required"] ?? ""),
          _buildDetailItem("Total Ascent",
              trekDetails['trek_overview']["total_ascent"] ?? ""),
          _buildDetailItem("Total Descent",
              trekDetails['trek_overview']["total_descent"] ?? ""),
          _buildDetailItem("Highest Point",
              trekDetails['trek_overview']["highest_point"] ?? ""),
          _buildDetailItem(
              "Difficulty", trekDetails['trek_overview']["difficulty"] ?? ""),
          _buildDetailItem(
              "Permits", trekDetails['trek_overview']["permits"] ?? ""),
          _buildDetailItem("Cost Per Day",
              trekDetails['trek_overview']["cost_per_day"] ?? ""),
          _buildDetailItem(
              "Guide", trekDetails['trek_overview']["guide"] ?? ""),
          _buildDetailItem("Accommodation",
              trekDetails['trek_overview']["accommodation"] ?? ""),
          _buildDetailItem(
              "Best Time", trekDetails['trek_overview']["best_time"] ?? ""),
          _buildDetailItem("Tips", trekDetails['trek_overview']["tips"] ?? ""),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //better font and size with beautiful ui
          Text(
            label + ": ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  // Widget _buildDetailItem(String label, String? value) {
  //   return Row(
  //     children: [
  //       Text(
  //         label + ": ",
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       Expanded(child: Text(value ?? "")),
  //     ],
  //   );
  // }

  _buildadditional_information(
      BuildContext context, Map<String, dynamic> additionalInformation) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Additional Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildPermitsSection(additionalInformation["permits"] ?? []),
          _buildDetailItem("Weather", additionalInformation["weather"] ?? ""),
          _buildDetailItem(
              "Communication", additionalInformation["communication"] ?? ""),
        ],
      ),
    );
  }

  Widget _buildPermitsSection(List<String> permits) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Permits",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: permits.map((permit) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("- $permit"),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildaccomodation(BuildContext context, String accommodation) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accommodation",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            accommodation,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildguide_and_porter(
      BuildContext context, Map<String, dynamic> guideAndPorter) {
    final Map<String, dynamic> guide = guideAndPorter["guide"];
    final Map<String, dynamic> porter = guideAndPorter["porter"];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Guide",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildGuideItem(guide),
          SizedBox(height: 16),
          Text(
            "Porter",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildPorterItem(porter),
        ],
      ),
    );
  }

  Widget _buildGuideItem(Map<String, dynamic> guide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name: ${guide["name"]}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("Experience: ${guide["experience"]}"),
        Text("Knowledge: ${guide["knowledge"]}"),
        SizedBox(height: 8),
        Text(
          "Responsibilities:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: guide["responsibilities"].map<Widget>((responsibility) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("- $responsibility"),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPorterItem(Map<String, dynamic> porter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name: ${porter["name"]}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("Role: ${porter["role"]}"),
        Text("Strength: ${porter["strength"]}"),
        SizedBox(height: 8),
        Text(
          "Responsibilities:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: porter["responsibilities"].map<Widget>((responsibility) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("- $responsibility"),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildsafety_and_health(
      BuildContext context, Map<String, dynamic> safetyAndHealth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Safety and Health",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildAltitudeSicknessSection(safetyAndHealth["altitude_sickness"]),
          _buildDetailItem(
              "Medical Facilities", safetyAndHealth["medical_facilities"]),
          _buildDetailItem(
              "Travel Insurance", safetyAndHealth["travel_insurance"]),
        ],
      ),
    );
  }

  Widget _buildAltitudeSicknessSection(Map<String, dynamic> altitudeSickness) {
    List<String> symptoms = altitudeSickness["symptoms"].cast<String>();
    String prevention = altitudeSickness["prevention"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Altitude Sickness",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        _buildDetailItem("Symptoms", _buildSymptomsList(symptoms) as String),
        SizedBox(height: 4),
        _buildDetailItem("Prevention", prevention),
      ],
    );
  }

  Widget _buildSymptomsList(List<String> symptoms) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: symptoms.map((symptom) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text("- $symptom"),
        );
      }).toList(),
    );
  }

  Widget _similarpackages() {
    return OfferSection2(
      title: "Similar Packages",
    );
  }

  Widget _recommendedpackages() {
    return OfferSection3(
      title: "Recommended packages",
    );
  }
}

Widget _buildTrekOverview(context, Map<String, dynamic> trekDetails) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Trek Overview',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Region: ${trekDetails['trek_details']['region']}',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Duration: ${trekDetails['trek_details']['duration']} days',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Difficulty: ${trekDetails['trek_details']['difficulty']}',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'Price: \$${trekDetails['trek_details']['price']}',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      SizedBox(height: 20),
    ],
  );
}

Widget _buildItinerary(context, Map<String, dynamic> trekDetails) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Itinerary',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          trekDetails['itinerary'].length,
          (index) {
            final day = 'day${index + 1}';
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                '${trekDetails['itinerary'][day]}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildHighlights(context, Map<String, dynamic> trekDetails) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Highlights',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          trekDetails['trek_details']['highlights'].length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      trekDetails['trek_details']['highlights'][index],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildWhatToPack(context, Map<String, dynamic> trekDetails) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'What to Pack',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Clothing',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              trekDetails['what_to_pack']['clothing'].length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${trekDetails['what_to_pack']['clothing'][index]}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Gear',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              trekDetails['what_to_pack']['gear'].length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${trekDetails['what_to_pack']['gear'][index]}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

//Gemini chat bot as a side features

class ChatPopup extends StatelessWidget {
  const ChatPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChangeNotifierProvider<GeminiChatProvider>(
              create: (_) => GeminiChatProvider(),
              child: ChatDialog(),
            );
          },
        );
      },
      child: const Icon(Icons.chat),
      backgroundColor: Colors.blue,
    );
  }
}

class ChatDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<GeminiChatProvider>(context);
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 400,
        height: 500,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!message['isUser'])
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'path_to_gemini_avatar_image',
                            ),
                          ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: message['isUser'] ? 40 : 16),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: message['isUser']
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: message['isUser']
                                ? Text(
                                    message['message'],
                                    style: TextStyle(color: Colors.blue),
                                  )
                                : FutureBuilder(
                                    future:
                                        Future.delayed(Duration(seconds: 2)),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      } else {
                                        return Text(
                                          message['message'],
                                          style: TextStyle(color: Colors.green),
                                        );
                                      }
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: chatProvider.controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    chatProvider.sendMessage(chatProvider.controller.text);
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
