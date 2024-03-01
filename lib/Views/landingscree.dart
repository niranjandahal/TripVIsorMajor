import 'package:flutter/material.dart';
import 'package:tripvisormajor/Widgets/HomeFullScreenShow.dart';
import 'package:tripvisormajor/Components/customtext.dart';
import 'package:tripvisormajor/Components/navcomponent.dart';
import 'package:tripvisormajor/Widgets/customdrawer.dart';
import 'package:tripvisormajor/Widgets/footer.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection1.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection2.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection3.dart';
import 'package:tripvisormajor/Widgets/tagsandads.dart';
import 'package:tripvisormajor/Widgets/searchbar.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            toolbarHeight: 60,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height,
            iconTheme: IconThemeData(color: Colors.white),
            // backgroundColor: Color.fromARGB(255, 90, 93, 247),
            backgroundColor: Color(0xFF5A5DF7),
            // backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              background: HomeFullScreenShow(),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1),
                      alignment: Alignment.centerLeft,
                      child: customText('TripVisor', 20,
                          color: Colors.white, weight: FontWeight.bold)),
                  Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.15),
                      child: customsearchbar()),
                  Container(
                    child: Row(
                      children: [
                        navcomponent('Destinations', 1),
                        navcomponent('packages', 2),
                        navcomponent('Custom plan', 3),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 125,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFFC454),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Register  ▼",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              onPressed: () {
                                //2 option register as user or agent
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: customText('Register as: ', 16),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              title: customText('User', 14),
                                              onTap: () {
                                                GoRouter.of(context)
                                                    .go('/register');
                                              },
                                            ),
                                            ListTile(
                                              title: customText('Agent', 14),
                                              onTap: () {
                                                GoRouter.of(context)
                                                    .go('/register');
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 20,
            ),
            TagDisplay(),
            OfferSection1(),
            OfferSection2(),
            OfferSection3(),
            CustomFooter(),
          ])),
        ],
      ),
    );
  }
}
